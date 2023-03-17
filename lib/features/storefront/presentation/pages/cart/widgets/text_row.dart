import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final MainAxisAlignment mainAxisAlignment;
  const TextRow(
      {super.key,
      required this.title,
      required this.value,
      this.titleStyle,
      this.valueStyle,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          value,
          style: valueStyle ??
              Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
