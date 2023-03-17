// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:saleor_app_flutter/core/theme/app_theme.dart';

class BorderedButton extends StatefulWidget {
  final TextStyle? textStyle;
  final String text;
  final bool positive;
  final double? width;
  void Function()? onPressed;

  BorderedButton({
    Key? key,
    this.textStyle,
    required this.text,
    required this.onPressed,
    this.positive = false,
    this.width,
  }) : super(key: key);

  @override
  State<BorderedButton> createState() => _BorderedButtonState();
}

class _BorderedButtonState extends State<BorderedButton> {
  Color fillColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          fillColor =
              widget.positive ? StoreTheme.breakerColor : StoreTheme.tentColor;
        });
      },
      onExit: (event) {
        setState(() {
          fillColor = Colors.transparent;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed != null
            ? () {
                setState(() {
                  fillColor = widget.positive
                      ? StoreTheme.breakerColor
                      : StoreTheme.tentColor;
                });
                widget.onPressed!();

              }
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.all(12),
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: widget.positive
                    ? StoreTheme.breakerColor
                    : StoreTheme.tentColor),
            color: fillColor,
          ),
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: widget.textStyle ??
                Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                        fillColor == Colors.transparent ? null : Colors.white),
          ),
        ),
      ),
    );
  }
}
