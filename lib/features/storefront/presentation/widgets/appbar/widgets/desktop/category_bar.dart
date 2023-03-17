import 'package:beamer/beamer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/category.dart';
import '../../../custom_text_buttom.dart';
import '../../../horizontal_product_list.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar(
      {super.key,
      required this.categories,
      this.fontSize = 16,
      this.fontColor,
      this.isMobile = false,
      this.stablizeSelection = false,
      required this.onHover});
  final List<Category> categories;
  final double fontSize;
  final bool isMobile;
  final bool stablizeSelection;
  final Color? fontColor;
  final void Function(PointerHoverEvent event, Category category)? onHover;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    final beamState = Beamer.of(context).currentBeamLocation.state as BeamState;
    String? paramsId = beamState.pathParameters['categoryId'];
    return ScrollConfiguration(
        behavior: ProductScrollBehavior(),
        child: widget.isMobile
            ? _buildMobile(context, paramsId)
            : _buildDesktop(context, paramsId));
  }

  Widget _buildMobile(BuildContext context, String? paramsId) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (Category category in widget.categories)
          MouseRegion(
            child: CustomTextButton(
              showBottomLine: paramsId == category.id,
              onTap: () => Beamer.of(context).beamToNamed("/c/${category.id}"),
              backgroundColor: Colors.transparent,
              text: Text(
                category.name,
                style: paramsId == category.id
                    ? Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: widget.fontSize)
                    : Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: widget.fontSize,
                        color: const Color(0xff8f8f8f)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context, String? paramsId) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        for (Category category in widget.categories)
          _ColorChangingButton(
            category: category,
            fontColor: widget.fontColor,
            fontSize: widget.fontSize,
            paramsId: paramsId,
            trueColor: const Color(0xffededed),
            stableBool: widget.stablizeSelection,
            onExit: (p0) {
              hovering = false;
              setState(() {});
            },
            onHover: (p0, category) {
              hovering = true;
              widget.onHover!(p0, category);
              setState(() {});
            },
          ),
      ],
    );
  }
}

class _ColorChangingButton extends StatefulWidget {
  const _ColorChangingButton(
      {required this.category,
      this.paramsId,
      required this.fontSize,
      this.onHover,
      this.onExit,
      this.stableBool = false,
      this.fontColor,
      this.trueColor = Colors.grey});
  final Category category;
  final String? paramsId;
  final double fontSize;
  final void Function(PointerHoverEvent, Category category)? onHover;
  final void Function(PointerExitEvent)? onExit;
  final bool stableBool;
  final Color trueColor;
  final Color? fontColor;
  @override
  State<_ColorChangingButton> createState() => __ColorChangingButtonState();
}

class __ColorChangingButtonState extends State<_ColorChangingButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        isHovered = false;
        if (widget.onExit != null) {
          widget.onExit!(event);
        }
        setState(() {});
      },
      onHover: (value) {
        if (widget.onHover != null) {
          isHovered = true;
          setState(() {
            widget.onHover!(value, widget.category);
          });
        }
      },
      child: CustomTextButton(
        backgroundColor: isHovered || widget.stableBool
            ? widget.trueColor
            : Colors.transparent,
        showBottomLine: widget.paramsId == widget.category.id,
        onTap: () => Beamer.of(context).beamToNamed("/c/${widget.category.id}"),
        text: Text(
          widget.category.name,
          style: widget.paramsId == widget.category.id
              ? Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: widget.fontSize, color: widget.fontColor)
              : Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: widget.fontSize, color: widget.fontColor),
        ),
      ),
    );
  }
}
