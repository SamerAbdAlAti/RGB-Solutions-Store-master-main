import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../features/storefront/presentation/pages/home/home_page.dart';
import '../../../features/storefront/presentation/pages/product_details/product_details_page.dart';

class ProductsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('home'),
          title: "تمور الحواري | الصفحة الرئيسية",
          type: BeamPageType.noTransition,
          child: HomePage()),
    ];
    final String? productIdPrameter = state.pathParameters['productId'];
    if (productIdPrameter != null) {
      final productId = productIdPrameter;
      pages.add(BeamPage(
        child: ProductDetailsPage(id: productId),
        type: BeamPageType.noTransition,
        key: ValueKey('product-$productId'),
      ));
    }
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => ['/p/:productId'];
}
