import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout_line.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/mobile/cubit/app_cubit.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/page_not_found/page_not_found.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_mobile_app_bar.dart';

import '../../../widgets/appbar/storefront_app_bar.dart';

class CheckoutMobile extends StatefulWidget {
  const CheckoutMobile({super.key});

  @override
  State<CheckoutMobile> createState() => _CheckoutMobileState();
}

class _CheckoutMobileState extends State<CheckoutMobile> {
  final _formKey = GlobalKey<FormState>();

  LatLong? _pickedLocation;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController street1 = TextEditingController();
  TextEditingController street2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postalcode = TextEditingController();
  TextEditingController country = TextEditingController(text: "Jordan");

  String selectedCity = '';
  String selectedArea = '';

  @override
  Widget build(BuildContext context) {
    User? user = Beamer.of(context).currentBeamLocation.data as User?;
    Size screenSize = MediaQuery.of(context).size;
    if (user != null) {
      Address? shipping = user.checkouts.first.shippingAddress;
      shipping != null ? _assignValues(shipping) : null;
      firstName.text = user.firstName;
      lastName.text = user.lastName;
      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: const StorefrontAppBar(isMobile: true),
              drawer: const MobileDrawer(),
              body: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return state.map(
                    initial: (value) {
                      return _fullWidget(
                        context,
                        screenSize,
                        user.checkouts.first,
                      );
                    },
                    loading: (value) {
                      return _fullWidget(
                        context,
                        screenSize,
                        user.checkouts.first,
                      );
                    },
                    readyOrder: (value) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Beamer.of(context).beamToReplacementNamed('/order',
                            data: value.order);
                      });

                      return _orderWidgetRouter(context);
                    },
                    ready: (value) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        final materialBanner = MaterialBanner(
                          elevation: 0,
                          onVisible: () async {
                            await Future.delayed(const Duration(seconds: 1));
                            if (mounted) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentMaterialBanner();
                            }
                          },
                          backgroundColor: Colors.transparent,
                          forceActionsBelow: true,
                          content: AwesomeSnackbarContent(
                            title: 'تم تثبيت التعديلات',
                            contentType: ContentType.success,
                            inMaterialBanner: true,
                            message: 'تم حفظ العنوان الجديد',
                          ),
                          actions: const [SizedBox.shrink()],
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentMaterialBanner()
                          ..showMaterialBanner(materialBanner);
                      });
                      return _fullWidget(context, screenSize, value.checkout);
                    },
                    error: (value) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        final materialBanner = MaterialBanner(
                          elevation: 0,
                          onVisible: () async {
                            await Future.delayed(const Duration(seconds: 1));
                            if (mounted) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentMaterialBanner();
                            }
                          },
                          backgroundColor: Colors.transparent,
                          forceActionsBelow: true,
                          content: AwesomeSnackbarContent(
                            title: 'حدث خطأ!!',
                            contentType: ContentType.failure,
                            inMaterialBanner: true,
                            message: value.message,
                          ),
                          actions: const [SizedBox.shrink()],
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentMaterialBanner()
                          ..showMaterialBanner(materialBanner);
                      });
                      return _fullWidget(
                          context, screenSize, user.checkouts.first);
                    },
                  );
                },
              )));
    } else {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Beamer.of(context).beamToNamed('/cart');
      });
      return const PageNotFound(
        noProducts: false,
      );
    }
  }

  Widget _orderWidgetRouter(BuildContext context) {
    return Container();
  }

  Widget _fullWidget(BuildContext context, Size screenSize, Checkout checkout) {
    return BlocBuilder<AppLocationCubit, AppLocationState>(
      builder: (context, state) {
        AppLocationCubit cubit = AppLocationCubit.get(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: SizedBox(
              width: screenSize.width * 0.98,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          const Text("ادخل العنوان"),
                          Divider(
                            color: StoreTheme.unselectedColor,
                            height: 40,
                          ),
                          Text(
                            "تأكد من كتابة الاسم الأول والأخير قبل تحديد الموقع.",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: firstName,
                                  decoration: CustomInputDecorations
                                      .desktopInputDecoration("الاسم الأول",
                                          Ionicons.person_outline),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'ادخل الاسم الأول';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: lastName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'ادخل الاسم الأخير';
                                    }
                                    return null;
                                  },
                                  decoration: CustomInputDecorations
                                      .desktopInputDecoration("الاسم الأخير",
                                          Ionicons.person_outline),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "حدد موقعك الحالي باستخدام الخريطة",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              ElevatedButton.icon(
                                  icon: const Icon(
                                    Ionicons.location_outline,
                                    size: 28,
                                  ),
                                  label: const Text('استخدم الخريطة'),
                                  onPressed: () {
                                    cubit.getLocationMethod().then((value) {
                                      if (state.lon != 1.0) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Material(
                                            color: Colors.transparent,
                                            child: SizedBox(
                                                child:
                                                    OpenStreetMapSearchAndPick(
                                                        center: LatLong(
                                                          state.lon,
                                                          state.lat,
                                                        ),
                                                        buttonColor: StoreTheme
                                                            .breakerColor,
                                                        buttonText:
                                                            'تثبيت الموقع',
                                                        onPicked: (pickedData) {
                                                          List<String> data =
                                                              pickedData.address
                                                                  .split(',');
                                                          _pickedLocation =
                                                              pickedData
                                                                  .latLong;
                                                          _assignTrims(data);

                                                          if (_formKey
                                                                  .currentState!
                                                                  .validate() &&
                                                              country.text
                                                                  .isNotEmpty) {
                                                            context
                                                                .read<
                                                                    CartBloc>()
                                                                .add(CartEvent
                                                                    .updateAddress(
                                                                  context
                                                                      .read<
                                                                          AuthBloc>()
                                                                      .localAccount(),
                                                                  _createAddress(),
                                                                  checkout.id,
                                                                ));
                                                          }
                                                          Navigator.pop(
                                                              context);
                                                        })),
                                          ),
                                        );
                                      }
                                    });
                                  }),
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: street1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'ادخل العنوان الأول';
                              }
                              return null;
                            },
                            decoration:
                                CustomInputDecorations.desktopInputDecoration(
                                    "العنوان الأول", Ionicons.home_outline),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: street2,
                            decoration:
                                CustomInputDecorations.desktopInputDecoration(
                                    "العنوان الثاني )اختياري(",
                                    Ionicons.home_outline),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: country,
                                  decoration: CustomInputDecorations
                                      .desktopInputDecoration(
                                          "الدولة", Ionicons.flag_outline),
                                  readOnly: true,
                                  validator: (value) {
                                    if (value!.isNotEmpty &&
                                        country.text != "Jordan") {
                                      country.clear();
                                      return 'يتم التوصيل الى داخل الأردن فقط.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: city,
                                  decoration: CustomInputDecorations
                                      .desktopInputDecoration(
                                          "المدينة", Icons.apartment_outlined),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'المدينة';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: postalcode,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'ادخل الرمز البريدي';
                                    }
                                    return null;
                                  },
                                  decoration: CustomInputDecorations
                                      .desktopInputDecoration("الرمز البريدي",
                                          Ionicons.mail_open_outline),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(child: SizedBox(width: 10)),
                            ],
                          ),
                          const SizedBox(height: 30),
                          _invoiceWidget(context, checkout),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              print(
                                  "#############################################${_pickedLocation}");
                              print(
                                  "#############################################${checkout.shippingMethods}");
                              if (_pickedLocation != null &&
                                  checkout.shippingMethods.isNotEmpty) {
                                context
                                    .read<CartBloc>()
                                    .add(CartEvent.placeOrder(
                                        context.read<AuthBloc>().localAccount(),
                                        checkout.shippingMethods
                                            .firstWhere((element) =>
                                                element.name == selectedArea)
                                            .id,
                                        [
                                          {
                                            "key": "lat",
                                            "value": _pickedLocation!.latitude
                                                .toString()
                                          },
                                          {
                                            "key": "long",
                                            "value": _pickedLocation!.longitude
                                                .toString()
                                          },
                                        ]));
                              } else {
                                final materialBanner = MaterialBanner(
                                  elevation: 0,
                                  onVisible: () async {
                                    await Future.delayed(
                                        const Duration(seconds: 1));
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentMaterialBanner();
                                    }
                                  },
                                  backgroundColor: Colors.transparent,
                                  forceActionsBelow: true,
                                  content: AwesomeSnackbarContent(
                                    title: 'لم يحدد موقع',
                                    contentType: ContentType.warning,
                                    inMaterialBanner: true,
                                    message: 'يرجى تحديد الموقع على الخريطة',
                                  ),
                                  actions: const [SizedBox.shrink()],
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentMaterialBanner()
                                  ..showMaterialBanner(materialBanner);
                              }
                            },
                            child: Text(
                              "ضع الطلب",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _invoiceWidget(BuildContext context, Checkout checkout) {
    double totalPrice = 0.000;
    for (CheckoutLine line in checkout.lines) {
      totalPrice += line.totalPrice;
    }
    if (checkout.shippingMethods.isNotEmpty) {
      totalPrice += checkout.shippingMethods[0].price;
    }
    return Container(
      color: Theme.of(context).cardTheme.color,
      child: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                Text(
                  "تفاصيل الطلب",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Divider(
                  thickness: 2,
                  height: 15.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "اسم المنتج",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: StoreTheme.commonColor,
                              fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "الكمية",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: StoreTheme.commonColor,
                              fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "السعر الإجمالي",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: StoreTheme.commonColor,
                              fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(height: 25, color: Colors.transparent),
                for (CheckoutLine line in checkout.lines)
                  _textWithQuantityList(
                      context,
                      line.product.name,
                      "${line.currency}${line.totalPrice}",
                      line.quantity.toString()),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                const Divider(
                  color: Colors.white,
                  height: 20,
                ),
                _textList(
                    context,
                    "التوصيل",
                    checkout.shippingMethods.isEmpty
                        ? "ادخل عنوانًا"
                        : "${checkout.currency} ${checkout.shippingMethods.first.price}",
                    titleStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 16),
                    valueStyle: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                            fontSize: 16, color: StoreTheme.breakerColor)),
                const SizedBox(height: 5),
                _textList(
                  context,
                  "المبلغ الكلي",
                  "JOD ${totalPrice.toStringAsFixed(3)}",
                  titleStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 18),
                  valueStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 18,
                            color: StoreTheme.tentColor,
                          ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget _textList(BuildContext context, String title, String value,
      {TextStyle? titleStyle, TextStyle? valueStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          value,
          style: valueStyle ??
              Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _textWithQuantityList(
      BuildContext context, String title, String value, String quantity,
      {TextStyle? titleStyle,
      TextStyle? valueStyle,
      TextStyle? quantityStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          quantity,
          style: quantityStyle ??
              Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: valueStyle ??
              Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  AddressModel _createAddress() {
    return AddressModel(
        id: '',
        firstName: firstName.text,
        lastName: lastName.text,
        streetAddress1: street1.text,
        streetAddress2: street2.text,
        cityArea: '',
        city: city.text,
        postalCode: postalcode.text,
        country: "Jordan");
  }

  void _assignTrims(List<String> trims) {
    street1.text = trims[0].trim();
    street2.text = trims[1].trim();
    postalcode.text = trims[trims.length - 2].trim();
    city.text = trims[trims.length - 3].trim();
    country.text = trims.last.trim();
  }

  void _assignValues(Address address) {
    firstName.text = address.firstName;
    lastName.text = address.lastName;
    city.text = address.city;
    street1.text = address.streetAddress1;
    street2.text = address.streetAddress2;
    postalcode.text = address.postalCode;
  }
}
