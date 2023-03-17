import 'package:flutter/material.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/account/desktop/desktop_account_page.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/pages/account/mobile/mobile_account_page.dart';
import 'package:saleor_app_flutter/features/storefront/presentation/widgets/easy_layout_builder.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLayoutBuilder(
      mobileWidget: MobileAccountPage(),
      desktopWidget: DesktopAccountPage(),
    );
  }
}
