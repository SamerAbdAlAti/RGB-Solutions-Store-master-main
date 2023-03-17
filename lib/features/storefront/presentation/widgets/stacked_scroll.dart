// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ionicons/ionicons.dart';
import 'package:saleor_app_flutter/core/theme/app_theme.dart';

class StackedScroll extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final double itemWidth;
  final bool autoScroll;
  const StackedScroll(
      {Key? key,
      required this.child,
      required this.scrollController,
      required this.itemWidth,
      required this.autoScroll})
      : super(key: key);

  @override
  State<StackedScroll> createState() => _StackedScrollState();
}

class _StackedScrollState extends State<StackedScroll> {
  bool _entered = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.autoScroll) {
        _autoScroll();
      }
    });
  }

  void _autoScroll() async {
    await Future.delayed(const Duration(seconds: 5));

    if (widget.scrollController.hasClients) {
      if (!_entered) {
        if (widget.scrollController.offset ==
            widget.scrollController.position.maxScrollExtent) {
          widget.scrollController.animateTo(
              widget.scrollController.position.minScrollExtent,
              duration: const Duration(seconds: 1),
              curve: Curves.ease);
        } else {
          widget.scrollController.animateTo(
              widget.scrollController.offset + widget.itemWidth,
              duration: const Duration(seconds: 1),
              curve: Curves.ease);
        }
      }
    }
    _autoScroll();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _entered = true;
        setState(() {});
      },
      onExit: (event) {
        _entered = false;
        setState(() {});
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.center, child: widget.child),
          Align(
              alignment: Alignment.bottomLeft,
              child: _button(
                  onTap: () {
                    if (widget.scrollController.offset ==
                        widget.scrollController.position.maxScrollExtent) {
                      widget.scrollController.animateTo(
                          widget.scrollController.position.minScrollExtent,
                          duration: const Duration(milliseconds: 360),
                          curve: Curves.ease);
                    } else {
                      widget.scrollController.animateTo(
                          widget.scrollController.offset + widget.itemWidth * 2,
                          duration: const Duration(milliseconds: 360),
                          curve: Curves.easeIn);
                    }
                  },
                  iconData: Ionicons.arrow_back_outline)),
          Align(
              alignment: Alignment.bottomRight,
              child: _button(
                  isRight: false,
                  onTap: () {
                    if (widget.scrollController.offset ==
                        widget.scrollController.position.minScrollExtent) {
                      widget.scrollController.animateTo(
                          widget.scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 360),
                          curve: Curves.ease);
                    } else {
                      widget.scrollController.animateTo(
                          widget.scrollController.offset - widget.itemWidth * 2,
                          duration: const Duration(milliseconds: 360),
                          curve: Curves.easeIn);
                    }
                  },
                  iconData: Ionicons.arrow_forward_outline))
        ],
      ),
    );
  }

  Widget _button(
      {required void Function() onTap,
      required IconData iconData,
      bool isRight = true}) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        width: _entered ? 50 : 0,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: isRight
                ? const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15))
                : const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
        child: Visibility(
            visible: _entered,
            child: Icon(iconData, color: StoreTheme.unselectedColor)),
      ),
    );
  }
}
