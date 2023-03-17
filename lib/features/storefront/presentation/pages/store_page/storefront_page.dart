
import 'package:flutter/material.dart';
import 'desktop_store_page.dart';
import 'mobile_store_page.dart';
import '../../widgets/easy_layout_builder.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EasyLayoutBuilder(mobileWidget: MobileStorePage(), desktopWidget: DesktopStorePage());
  }
}