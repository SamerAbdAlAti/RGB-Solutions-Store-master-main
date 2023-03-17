import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class OnHoverOptions extends StatefulWidget {
  const OnHoverOptions(
      {super.key,
      required this.child,
      required this.actions,
      this.isRow = true,
      this.mainAxisAlignment,
      this.crossAxisAlignment});
  final Widget child;
  final List<Widget> actions;
  final bool isRow;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  State<OnHoverOptions> createState() => OnHoverOptionsState();
}

class OnHoverOptionsState extends State<OnHoverOptions> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _hovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          _hovering = false;
        });
      },
      child: Blur(
          blur: !_hovering ? 0 : 10,
          colorOpacity: !_hovering ? 0 : 0.4,
          overlay: _hovering
              ? widget.isRow
                  ? Wrap(
                      runSpacing: 10,
                      spacing: 10,
                      children: widget.actions,
                    )
                  : Column(
                      crossAxisAlignment: widget.crossAxisAlignment ??
                          CrossAxisAlignment.center,
                      mainAxisAlignment:
                          widget.mainAxisAlignment ?? MainAxisAlignment.start,
                      children: widget.actions,
                    )
              : null,
          child: widget.child),
    );
  }
}
