import 'package:flutter/material.dart';

import 'desktop/desktop_register.dart';
import 'mobile/mobile_register.dart';
import '../../widgets/easy_layout_builder.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyLayoutBuilder(
        mobileWidget: MobileRegisterPage(),
        desktopWidget: DesktopRegisterPage());
  }
}
