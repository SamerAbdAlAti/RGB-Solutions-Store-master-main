import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/account/account_page.dart';

class AccountLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
            key: ValueKey('account'),
            title: "تمور الحواري | حسابي",
            type: BeamPageType.noTransition,
            child: AccountPage()),
      ];

  @override
  List<Pattern> get pathPatterns => ['/account'];
}
