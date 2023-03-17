import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/banner_page/desktop/desktop_banner_page.dart';

class BannerEditLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('banner'),
            title: "تمور الحواري | الصور",
            type: BeamPageType.noTransition,
            child: DesktopBanner()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/banner'];
}
