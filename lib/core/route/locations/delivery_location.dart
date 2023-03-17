import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/delivery/delivery_page.dart';

class DeliveryLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('delivery'),
            title: "تمور الحواري | توصيل",
            type: BeamPageType.noTransition,
            child: DeliveryPage()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/delivery'];
}
