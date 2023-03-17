import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../features/storefront/presentation/pages/login/register_page.dart';

class RegisterLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('register'),
            title: "تمور الحواري | تسجيل دخول",
            type: BeamPageType.noTransition,
            child: RegisterPage()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/register'];
}
