import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../features/storefront/presentation/pages/about_page/about_page.dart';

class AboutLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('about'),
            title: "تمور الحواري | تواصل معنا",
            type: BeamPageType.noTransition,
            child: AboutPage()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/about'];
}
