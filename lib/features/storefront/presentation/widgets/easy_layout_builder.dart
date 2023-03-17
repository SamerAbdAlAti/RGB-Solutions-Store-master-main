import 'package:flutter/material.dart';

class EasyLayoutBuilder extends StatelessWidget {
  const EasyLayoutBuilder(
      {super.key, required this.mobileWidget, required this.desktopWidget});
  final Widget mobileWidget;
  final Widget desktopWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return SafeArea(child: mobileWidget);
        } else {
          return desktopWidget;
        }
      },
    );
  }
}
