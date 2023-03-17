import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../features/storefront/presentation/pages/page_not_found/page_not_found.dart';

class PageNotFoundLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
          child: PageNotFound(noProducts: false),
          key: ValueKey('page_not_found'),
          type: BeamPageType.noTransition,
          title: "تمور الحواري | ضايع؟",
        )
      ];

  @override
  List<Pattern> get pathPatterns => ['/404'];
}
