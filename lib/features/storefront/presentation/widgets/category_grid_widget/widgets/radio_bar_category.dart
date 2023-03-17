// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class RadioBarCategory extends StatelessWidget {
  const RadioBarCategory({
    Key? key,
    required this.buttonLables,
    required this.buttonValues,
    required this.defaultButtonValue,
    this.customTextStyle,
    this.elevation = 0,
    required this.onValue,
  }) : super(key: key);
  final List<String> buttonLables;
  final List<String> buttonValues;
  final String defaultButtonValue;
  final ButtonTextStyle? customTextStyle;
  final double elevation;

  final void Function(String value) onValue;

  @override
  Widget build(BuildContext context) {
    return CustomRadioButton(
        absoluteZeroSpacing: true,
        elevation: elevation,
        defaultSelected: defaultButtonValue,
        unSelectedBorderColor: Colors.transparent,
        selectedBorderColor: Colors.transparent,
        buttonLables: buttonLables,
        buttonValues: buttonValues,
        autoWidth: true,
        radioButtonValue: onValue,
        buttonTextStyle: customTextStyle ?? const ButtonTextStyle(),
        unSelectedColor: Theme.of(context)
                .elevatedButtonTheme
                .style
                ?.foregroundColor
                ?.resolve({MaterialState.pressed}) ??
            Colors.white,
        selectedColor: Theme.of(context)
                .elevatedButtonTheme
                .style
                ?.backgroundColor
                ?.resolve({MaterialState.pressed}) ??
            Colors.orange);
  }
}
