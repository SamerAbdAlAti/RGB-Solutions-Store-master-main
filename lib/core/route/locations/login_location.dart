import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../features/storefront/presentation/pages/login/login_page.dart';

class LoginLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('login'),
            title: "تمور الحواري | تسجيل دخول",
            type: BeamPageType.noTransition,
            child: LoginPage()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/login'];
}
