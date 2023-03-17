import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../features/storefront/presentation/pages/home/home_page.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('home'),
            title: "تمور الحواري | الرئيسية",
            type: BeamPageType.noTransition,
            child: HomePage()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/'];
}
