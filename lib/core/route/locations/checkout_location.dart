import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/checkout_page/checkout_page.dart';

class CheckoutLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('checkout'),
            title: "تمور الحواري | حدد الموقع",
            type: BeamPageType.noTransition,
            child: CheckoutPage()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/checkout'];
}
