import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/cart/cart_page.dart';

class CartLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('cart'),
            title: "تمور الحواري | السلة",
            type: BeamPageType.noTransition,
            child: CartPage()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/cart'];
}
