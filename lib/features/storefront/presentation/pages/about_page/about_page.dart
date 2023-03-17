import 'package:flutter/material.dart';
import 'desktop_about_page.dart';
import 'mobile_about_page.dart';
import '../../widgets/easy_layout_builder.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyLayoutBuilder(
        mobileWidget: MobileAboutPage(), desktopWidget: DesktopAboutPage());
  }
}
