import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/order_details/order_details.dart';

class OrderLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('order'),
            title: "تمور الحواري | الطلب",
            type: BeamPageType.noTransition,
            child: OrderDetails()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/order'];
}
