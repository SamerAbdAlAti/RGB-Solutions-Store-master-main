// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/bloc/storefront_bloc.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/page_not_found/page_not_found.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/product_details/widgets/details_area.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/product_details/widgets/media_product_selector.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/product_details/widgets/review_area/review_area.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/appbar/storefront_mobile_app_bar.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/product_helper.dart';

import '../../widgets/add_to_cart_button.dart';
import '../../widgets/appbar/storefront_app_bar.dart';
import '../../widgets/dialog_manager.dart';
import '../../widgets/footer_wrapper.dart';
import 'widgets/rating_bar.dart';

class MobileProductDetails extends StatefulWidget {
  final String id;
  const MobileProductDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<MobileProductDetails> createState() => _MobileProductDetailsState();
}

class _MobileProductDetailsState extends State<MobileProductDetails> {
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
                    // appBar: const StorefrontAppBar(isMobile: true),
                    drawer: const MobileDrawer(),
                    body: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FooterWrapper(
                          child: SingleChildScrollView(
                              padding: const EdgeInsets.only(bottom: 35),
                              child: _buildFullWidget(context, product))),
                    ));
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

    return IntrinsicHeight(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product!.name,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  ValueListenableBuilder(
                      valueListenable: _rating,
                      builder: (context, value, child) {
                        return RatingBarForProduct(
                          product: product,
                          realRating: value,
                        );
                      }),
                ],
              ),

              Divider(
                indent: 50,
                endIndent: 50,
                color: StoreTheme.tentColor,
                thickness: 2,
              ),
              ProductHelper.descriptionBuilder(context, product.description,
                  boldFontSize: 18, defualtFontSize: 16),
              Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    MediaSelector(
                      mediaUrls: product.media,
                      isMobile: true,
                      height: 150,
                    ),
                  ],
                ),
              ),
              _productChoices(product)
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text("التقيمات"),
          Divider(
            color: StoreTheme.unselectedColor,
            thickness: 1,
            indent: 80,
            height: 30,
            endIndent: 80,
          ),
          Expanded(
            child: ReviewArea(
              product: product,
              isMobile: true,
              onAvgRating: (avgRating) {
                _rating.value = avgRating;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _productChoices(Product product) {
    return Card(
      elevation: 5,
      color: Colors.black54,
      margin: const EdgeInsets.all(4),
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
                  btnColor1: Colors.green,
                  btnColor2: Colors.red,
                  showMessageLimit: false,
                  maxVal: product.defaultVariant.quantityAvailable,
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
        appBar: StorefrontAppBar(isMobile: true),
        drawer: MobileDrawer(),
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
