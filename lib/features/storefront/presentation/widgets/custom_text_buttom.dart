import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.showBottomLine,
      required this.onTap});
  final Text text;
  final bool showBottomLine;
  final void Function() onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text,
              showBottomLine
                  ? Container(
                      height: 1,
                      width: text.data!.length.toDouble() * 3,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 3,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
