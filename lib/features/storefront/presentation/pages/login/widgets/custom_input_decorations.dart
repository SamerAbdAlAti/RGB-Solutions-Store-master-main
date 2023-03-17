import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_theme.dart';

class CustomInputDecorations {
  static InputDecoration desktopInputDecoration(
      String hintText, IconData iconData,
      {bool isDense = true,
      EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 1)}) {
    return InputDecoration(
      contentPadding: padding,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: StoreTheme.tentColor)),
      focusColor: StoreTheme.tentColor,
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 20.0),
      filled: true,
      isDense: isDense,
      prefixIcon: Icon(
        iconData,
        size: 18,
        color: StoreTheme.commonColor,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: StoreTheme.tentColor)),
    );
  }

  static dropMenuInputDecoration() {
    InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      focusColor: StoreTheme.tentColor,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: StoreTheme.tentColor)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: StoreTheme.tentColor)),
    );
  }
}
