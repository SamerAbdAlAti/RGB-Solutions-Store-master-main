import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';

class ProductHelper {
  static Widget descriptionBuilder(BuildContext context, String? description,
      {double defualtFontSize = 16,
      double boldFontSize = 17,
      Color? textColor}) {
    return EasyRichText(
      description ?? "",
      selectable: true,
      defaultStyle: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontSize: defualtFontSize, color: textColor),
      patternList: [
        EasyRichTextPattern(
          targetString: '(\\*)(.*?)(\\*)',
          matchBuilder: (context, match) {
            return TextSpan(
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: boldFontSize,
                  fontWeight: FontWeight.bold,
                  color: textColor),
              text: match?[0]?.replaceAll(
                '*',
                ''..replaceAll('*', ''),
              ),
            );
          },
        ),
      ],
    );
  }
}
