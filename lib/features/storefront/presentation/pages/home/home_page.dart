import 'package:flutter/material.dart';

import '../../widgets/easy_layout_builder.dart';
import 'desktop_home_page.dart';
import 'mobile_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyLayoutBuilder(
        mobileWidget: MobileHomePage(), desktopWidget: DesktopHomePage());
  }
}
