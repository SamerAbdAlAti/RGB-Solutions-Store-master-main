import 'package:beamer/beamer.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/core/utl/phone_converter.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout_line.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/widgets/text_row.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/login/widgets/custom_input_decorations.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/mobile/cubit/app_cubit.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/page_not_found/page_not_found.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/bordered_button.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/dialog_manager.dart';

import '../../../widgets/footer_wrapper.dart';

class CheckoutDekstop extends StatefulWidget {
  const CheckoutDekstop({super.key});

  @override
  State<CheckoutDekstop> createState() => _CheckoutDekstopState();
}

class _CheckoutDekstopState extends State<CheckoutDekstop> {
  final _formKey = GlobalKey<FormState>();

  LatLong? _pickedLocation;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController street1 = TextEditingController();
  TextEditingController street2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController(); // text: "Jordan";
  TextEditingController location = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController postalcode = TextEditingController();
  bool servicestatus = false;
  bool haspermission = false;
  String selectedCity = '';
  String selectedArea = '';
  List<String> _areas = [];
  bool firstTimer = true;

  @override
  Widget build(BuildContext context) {
    User? user = Beamer.of(context).currentBeamLocation.data as User?;
    Size screenSize = MediaQuery.of(context).size;
    if (user != null) {
      Address? shipping = user.checkouts.first.shippingAddress;
      if (firstTimer) {
        firstTimer = false;
        shipping != null ? _assignValues(shipping) : null;
      }
      firstName.text = user.firstName;
      lastName.text = user.lastName;

      if (user.checkouts.first.shippingMethods.isEmpty) {
        context.read<CartBloc>().add(CartEvent.updateAddress(
            context.read<AuthBloc>().localAccount(),
            _createAddress(),
            user.checkouts.first.id));
      }
      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: const StorefrontAppBar(),
              body: FooterWrapper(
                child: BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return state.map(
                      initial: (value) {
                        return _fullWidget(
                            context,
                            screenSize,
                            user.checkouts.first,
                            PhoneConverter().toPhone(user.email));
                      },
                      loading: (value) {
                        return _fullWidget(
                            context,
                            screenSize,
                            user.checkouts.first,
                            PhoneConverter().toPhone(user.email));
                      },
                      readyOrder: (value) {
                        /// TODO: Check This
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Beamer.of(context).beamToReplacementNamed(
                            '/order',
                            data: value.order,
                          );
                        });

                        return const SizedBox.shrink();
                      },
                      ready: (value) {
                        /// TODO: Check This
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          DialogManager.successDialog(
                            context: context,
                            title: 'تم تثبيت التعديلات',
                            message: 'تم حفظ العنوان الجديد',
                          );
                        });

                        user.checkouts.first.shippingMethods =
                            value.checkout.shippingMethods;

                        return _fullWidget(context, screenSize, value.checkout,
                            PhoneConverter().toPhone(user.email));
                      },
                      error: (value) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          DialogManager.errorDialog(
                              context: context,
                              description: value.message,
                              title: 'خطأ');
                        });
                        return _fullWidget(
                            context,
                            screenSize,
                            user.checkouts.first,
                            PhoneConverter().toPhone(user.email));
                      },
                    );
                  },
                ),
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

  Widget _fullWidget(
      BuildContext context, Size screenSize, Checkout checkout, String phone) {
    print(checkout);
    print("here last");
    return BlocBuilder<AppLocationCubit, AppLocationState>(
      builder: (context, state) {
        AppLocationCubit cubit = AppLocationCubit.get(context);
        return SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: SizedBox(
              width: screenSize.width * 0.75,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(12),
                                color: Theme.of(context).cardTheme.color,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "معلومات المستخدم",
                                      textAlign: TextAlign.center,
                                    ),
                                    const Divider(
                                      color: Colors.black45,
                                      height: 20,
                                    ),
                                    TextRow(
                                      title: "اسم المستخدم: ",
                                      value:
                                          "${firstName.text} ${lastName.text}",
                                    ),
                                    const SizedBox(height: 10),
                                    TextRow(
                                        title: "رقم الهاتف: ", value: phone),
                                    const SizedBox(height: 20),
                                  ],
                                )),
                            const Divider(
                              height: 25,
                              color: Colors.transparent,
                            ),
                            _invoiceWidget(context, checkout),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(children: [
                          const Text("عنوان التوصيل"),
                          Divider(
                              color: StoreTheme.unselectedColor, height: 40),
                          BorderedButton(
                              text: "حدد الموقع على الخريطة",
                              positive: true,
                              onPressed: () {
                                cubit.getLocationMethod().then((value) {
                                  if (state.lon != 1.0) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Material(
                                        color: Colors.transparent,
                                        child: SizedBox(
                                            child: OpenStreetMapSearchAndPick(
                                                center: LatLong(
                                                  state.lon,
                                                  state.lat,
                                                ),
                                                buttonColor:
                                                    StoreTheme.breakerColor,
                                                buttonText: 'تثبيت الموقع',
                                                onPicked: (pickedData) {
                                                  List<String> data = pickedData
                                                      .address
                                                      .split(',');
                                                  _pickedLocation =
                                                      pickedData.latLong;
                                                  _assignTrims(data);

                                                  if (_formKey.currentState!
                                                          .validate() &&
                                                      country.text.isNotEmpty) {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(CartEvent
                                                            .updateAddress(
                                                          context
                                                              .read<AuthBloc>()
                                                              .localAccount(),
                                                          _createAddress(),
                                                          checkout.id,
                                                        ));
                                                  }
                                                  Navigator.pop(context);
                                                })),
                                      ),
                                    );
                                  }
                                });
                              }),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                  child: DropdownSearch(
                                      popupProps: const PopupProps.menu(
                                          fit: FlexFit.loose),
                                      onChanged: (value) {
                                        selectedCity = value ?? '';
                                        setState(() {
                                          _areas = _areaEntries(checkout);
                                          print("object$checkout");
                                        });
                                        if (_formKey.currentState!.validate() &&
                                            country.text.isNotEmpty) {
                                          context.read<CartBloc>().add(
                                              CartEvent.updateAddress(
                                                  context
                                                      .read<AuthBloc>()
                                                      .localAccount(),
                                                  _createAddress(),
                                                  checkout.id));
                                        }
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "ادخل المدينة";
                                        }
                                        return null;
                                      },
                                      selectedItem: selectedCity,
                                      dropdownBuilder: (context, selectedItem) {
                                        return Text(
                                          selectedItem ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall,
                                          textAlign: TextAlign.center,
                                        );
                                      },
                                      items: _cityEntries(checkout))),
                              const SizedBox(width: 10),
                              Expanded(
                                  child: DropdownSearch(
                                selectedItem: selectedArea,
                                popupProps:
                                    const PopupProps.menu(fit: FlexFit.loose),
                                asyncItems: (text) {
                                  return Future.value(_areas);
                                },
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                    dropdownSearchDecoration:
                                        CustomInputDecorations
                                            .dropMenuInputDecoration()),
                                onChanged: (value) {
                                  setState(() {
                                    selectedArea = value ?? '';
                                  });
                                  if (_formKey.currentState!.validate() &&
                                      country.text.isNotEmpty) {
                                    context.read<CartBloc>().add(
                                        CartEvent.updateAddress(
                                            context
                                                .read<AuthBloc>()
                                                .localAccount(),
                                            _createAddress(),
                                            checkout.id));
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "ادخل منطقة";
                                  }
                                  return null;
                                },
                                dropdownBuilder: (context, selectedItem) {
                                  return Text(
                                    selectedItem ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                    textAlign: TextAlign.center,
                                  );
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            cursorHeight: 30.0,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 16.0),
                            controller: location,
                            decoration:
                                CustomInputDecorations.desktopInputDecoration(
                                    "المنطقة بالكامل", Ionicons.location),
                            onTap: () {
                              if (location.text == "أدخل اسم المكان بالكامل") {
                                location.clear();
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'أدخل اسم المكان بالكامل';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              if (_formKey.currentState!.validate() &&
                                  country.text.isNotEmpty) {
                                context.read<CartBloc>().add(
                                    CartEvent.updateAddress(
                                        context.read<AuthBloc>().localAccount(),
                                        _createAddress(),
                                        checkout.id));
                                // print(object);
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          FocusScope(
                            onFocusChange: (value) {
                              if (_formKey.currentState!.validate() &&
                                  country.text.isNotEmpty) {
                                context.read<CartBloc>().add(
                                    CartEvent.updateAddress(
                                        context.read<AuthBloc>().localAccount(),
                                        _createAddress(),
                                        checkout.id));
                              }
                            },

                            /// TODO: Check That Four

                            child: TextFormField(
                              controller: note,
                              maxLines: 5,
                              cursorWidth: 1,
                              cursorHeight: 30.0,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 20.0),
                              onFieldSubmitted: (value) {
                                if (_formKey.currentState!.validate() &&
                                    country.text.isNotEmpty) {
                                  context.read<CartBloc>().add(
                                      CartEvent.updateAddress(
                                          context
                                              .read<AuthBloc>()
                                              .localAccount(),
                                          _createAddress(),
                                          checkout.id));
                                }
                              },
                              decoration:
                                  CustomInputDecorations.desktopInputDecoration(
                                      "ملاحظات", Ionicons.book_outline,
                                      padding: const EdgeInsets.all(12),
                                      isDense: false),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _invoiceWidget(BuildContext context, Checkout checkout) {
    double totalPrice = 0.00;
    double totalQuantity = 0.00;
    for (CheckoutLine line in checkout.lines) {
      totalPrice += line.totalPrice;
      totalQuantity += line.quantity;
      // print(totalPrice);
    }
    if (selectedArea.isNotEmpty) {
      totalPrice += checkout.shippingMethods
          .firstWhere((element) => element.name == selectedArea)
          .price;
    }

    return Container(
      color: Theme.of(context).cardTheme.color,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
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
                  color: Colors.black45,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          for (CheckoutLine line in checkout.lines)
                            Text(
                              line.product.name,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 11.5),
                            )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "العدد",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: StoreTheme.commonColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          for (CheckoutLine line in checkout.lines)
                            Text("$totalQuantity",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الكمية",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: StoreTheme.commonColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          for (CheckoutLine line in checkout.lines)
                            Text(line.variantName.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "السعر الإجمالي",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: StoreTheme.commonColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          for (CheckoutLine line in checkout.lines)
                            Text("${line.product.currency} ${totalPrice}",
                                // line.product.amount,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 25, color: Colors.transparent),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const Divider(
                  color: Colors.black45,
                  height: 20,
                ),
                TextRow(
                    title: "التوصيل",
                    value: checkout.shippingMethods.isEmpty
                        ? "ادخل عنوانًا"
                        : selectedArea.isEmpty
                            ? "اختر منطقة للتوصيل"
                            : "${checkout.currency} ${checkout.shippingMethods.firstWhere((element) => element.name == selectedArea).price}",
                    titleStyle: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 16),
                    valueStyle: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                            fontSize: 16, color: StoreTheme.breakerColor)),
                checkout.shippingMethods.isNotEmpty && selectedArea.isNotEmpty
                    ? TextRow(
                        title: "فترة التوصيل",
                        value:
                            "من ${checkout.shippingMethods.firstWhere((element) => element.name == selectedArea).minimumDeliveryDays} ساعة الى ${checkout.shippingMethods.firstWhere((element) => element.name == selectedArea).maximumDeliveryDays} ساعة")
                    : const SizedBox(height: 5),
                TextRow(
                  title: "المبلغ الكلي",
                  value: "JOD${totalPrice}",
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
                const SizedBox(height: 20),
                BlocBuilder<AppLocationCubit, AppLocationState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (state.lon != 1.0) {
                          if (_pickedLocation != null &&
                              checkout.shippingMethods.isNotEmpty) {
                            context.read<CartBloc>().add(
                                CartEvent.updateAddress(
                                    context.read<AuthBloc>().localAccount(),
                                    _createAddress(),
                                    checkout.id));
                            context.read<CartBloc>().add(CartEvent.placeOrder(
                                    context.read<AuthBloc>().localAccount(),
                                    checkout.shippingMethods
                                        .firstWhere((element) =>
                                            element.name == selectedArea)
                                        .id,
                                    [
                                      {
                                        "key": "lat",
                                        "value":
                                            _pickedLocation!.latitude.toString()
                                      },
                                      {
                                        "key": "long",
                                        "value": _pickedLocation!.longitude
                                            .toString()
                                      },
                                    ]));
                          } else {
                            DialogManager.warningDialog(
                                context: context,
                                description: "حدد موقعك",
                                title: "حدد موقعك على الخريطة");
                          }
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
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AddressModel _createAddress() {
    return AddressModel(
      id: '',
      firstName: firstName.text,
      lastName: lastName.text,
      streetAddress1: street1.text.isEmpty ? "ادخل شارع" : street1.text,
      streetAddress2: street2.text,
      cityArea: selectedArea,
      city: city.text.isEmpty ? "" : city.text,
      postalCode: "13111",
      country: "Jordan",
    );
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
    location.text = "${city.text}, ${street1.text}, ${street2.text}";
  }

  List<String> _cityEntries(Checkout checkout) {
    List<String> states = [];
    print(checkout.shippingMethods);
    print("here");
    if (checkout.shippingMethods.isNotEmpty) {
      checkout.shippingMethods
          .map((e) => e.description)
          .toSet()
          .toList()
          .forEach((element) {
        states.add(element ?? '');
      });
    }
    return states;
  }

  List<String> _areaEntries(Checkout checkout) {
    List<String> areas = [];
    print(checkout.shippingMethods);
    print("here");

    if (checkout.shippingMethods.isNotEmpty) {
      if (selectedCity.isNotEmpty) {
        checkout.shippingMethods
            .where((element) => element.description == selectedCity)
            .forEach((element) {
          areas.add(element.name);
        });
        selectedArea = areas.first;
      }
    }
    return areas;
  }
}
