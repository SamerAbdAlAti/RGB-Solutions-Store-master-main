import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../features/storefront/presentation/pages/store_page/storefront_page.dart';

class StoreLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('store'),
            title: "تمور الحواري | المتجر",
            type: BeamPageType.noTransition,
            child: StorePage())
      ];

  @override
  List<Pattern> get pathPatterns => ['/store'];
}
