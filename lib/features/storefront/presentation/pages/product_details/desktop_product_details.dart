// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/bloc/storefront_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/page_not_found/page_not_found.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/product_details/widgets/media_product_selector.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/add_to_cart_button.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/dialog_manager.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/product_helper.dart';

import '../../widgets/footer_wrapper.dart';
import 'widgets/details_area.dart';
import 'widgets/rating_bar.dart';
import 'widgets/review_area/review_area.dart';

class DesktopProductDetails extends StatefulWidget {
  final String id;
  const DesktopProductDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DesktopProductDetails> createState() => _DesktopProductDetailsState();
}

class _DesktopProductDetailsState extends State<DesktopProductDetails> {
  int _quantityMeeter = 1;
  bool firstTimer = false;
  late ValueNotifier<String> _selectedVariantId;
  ValueNotifier<double> _rating = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    Product? product = Beamer.of(context).currentBeamLocation.data as Product?;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<StorefrontBloc, StorefrontState>(
          builder: (context, state) {
        return FutureBuilder(
          future:
              product == null ? _getProduct(context) : Future.value(product),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const _PageLoading();
              case ConnectionState.done:
                if (!snapshot.hasData) return const _BuildNotFound();
                product = snapshot.data;
                if (!firstTimer) {
                  firstTimer = true;
                  _selectedVariantId =
                      ValueNotifier(product!.defaultVariant.id);
                  _rating = ValueNotifier(0);
                }
                return Scaffold(
                    appBar: const StorefrontAppBar(),
                    body: FooterWrapper(
                        child: SingleChildScrollView(
                            padding: const EdgeInsets.only(bottom: 35),
                            child: _buildFullWidget(context, product))));
              default:
                return const _PageLoading();
            }
          },
        );
      }),
    );
  }

  Future<Product> _getProduct(BuildContext context) async => await context
      .read<StorefrontBloc>()
      .getSingleProduct(widget.id, 'default-channel');

  Widget _buildFullWidget(BuildContext context, Product? product) {
    Size screenSize = MediaQuery.of(context).size;

    // String availabilityText = product!.isAvailable ? "*متوفر*" : "نفدت الكمية";
    return Title(
      title: product!.name,
      color: Theme.of(context).textTheme.titleLarge!.color ?? Colors.orange,
      child: Center(
        child: SizedBox(
          width: screenSize.width * 0.75,
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        product.name,
                                        style:
                                        Theme.of(context).textTheme.displayMedium,
                                      ),
                                    ),
                                    flex: 5,
                                  ),
                                  SizedBox(width: 80.0,),
                                  Expanded(
                                    flex: 3,
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: ValueListenableBuilder(
                                            valueListenable: _rating,
                                            builder: (context, value, child) {
                                              return RatingBarForProduct(
                                                product: product,
                                                realRating: value,
                                              );
                                            })),
                                  ),
                                ],
                              ),
                              // Divider(
                              //   indent: screenSize.width / 2.2,
                              //   color: StoreTheme.tentColor,
                              //   thickness: 2,
                              // ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: ProductHelper.descriptionBuilder(
                                      context, product.description,
                                      boldFontSize: 22, defualtFontSize: 20)),
                              _productChoices(product),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              MediaSelector(
                                mediaUrls: product.media,
                                height: 600,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const Text("التقيمات"),
                  Divider(
                    color: StoreTheme.unselectedColor,
                    thickness: 1,
                    indent: 80,
                    height: 40,
                    endIndent: 80,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: screenSize.width / 10,
                          left: screenSize.width / 10),
                      child: ReviewArea(
                        product: product,
                        onAvgRating: (avgRating) {
                          _rating.value = avgRating;
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _productChoices(Product product) {
    return Card(
      color: Colors.grey[600],
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DetailsAreaProduct(
                product: product,
                onSelected: (String selectedId) {
                  _selectedVariantId.value = selectedId;
                }),
            Row(
              children: [
                product.isAvailable
                    ? ValueListenableBuilder(
                        valueListenable: _selectedVariantId,
                        builder: (context, value, child) {
                          return AddToCartButton(
                            product: product,
                            variantId: value,
                            intCallback: () => _quantityMeeter,
                            onError: (message) {
                              DialogManager.errorDialog(
                                  context: context,
                                  description: message,
                                  title: 'خطأ');
                            },
                          );
                        })
                    : Text(
                        "نفدت الكمية",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.error),
                      ),
                const Expanded(child: SizedBox(width: 5)),
                InputQty(
                  onQtyChanged: (value) {
                    _quantityMeeter = value!.toInt();
                  },
                  minVal: 1,
                  showMessageLimit: false,
                  maxVal: product.defaultVariant.quantityAvailable,
                  btnColor1: Colors.green,
                  btnColor2: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _PageLoading extends StatelessWidget {
  const _PageLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: StorefrontAppBar(),
        body: Center(
          child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(strokeWidth: 2)),
        ));
  }
}

class _BuildNotFound extends StatelessWidget {
  const _BuildNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
        title: "تمور الحواري | ضايع؟",
        color: Theme.of(context).textTheme.titleLarge!.color ?? Colors.orange,
        child: const PageNotFound(noProducts: false));
  }
}



// CustomRadioButton(
//                           buttonLables: const [
//                             "التقيمات",
//                           ],
//                           buttonValues: const [
//                             "REVIEW",
//                           ],
//                           autoWidth: true,
//                           absoluteZeroSpacing: true,
//                           padding: 12,
//                           height: 60,
//                           defaultSelected: "REVIEW",
//                           unSelectedBorderColor: Colors.transparent,
//                           selectedBorderColor: Colors.transparent,
//                           buttonTextStyle: ButtonTextStyle(
//                               selectedColor: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .color ??
//                                   Colors.grey,
//                               textStyle: Theme.of(context)
//                                   .textTheme
//                                   .titleMedium!
//                                   .copyWith(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w800),
//                               unSelectedColor: StoreTheme.unselectedColor),
//                           elevation: 0,
//                           radioButtonValue: (value) {},
//                           unSelectedColor: Colors.transparent,
//                           selectedColor: Colors.transparent),
