import 'package:flutter/material.dart';

import '../../widgets/easy_layout_builder.dart';
import 'desktop/desktop_login.dart';
import 'mobile/mobile_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyLayoutBuilder(
        mobileWidget: MobileLoginPage(), desktopWidget: DesktopLoginPage());
  }
}
