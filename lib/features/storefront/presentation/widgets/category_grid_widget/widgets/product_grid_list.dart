// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProductGridList<T> extends StatelessWidget {
  const ProductGridList(
      {Key? key,
      required this.items,
      required this.itemBuilder,
      required this.width,
      this.itemRatio = 6 / 5,
      this.useDivider = true,
      this.itemInRow,
      this.itemHeight,
      this.customGridDelegate,
      this.padding})
      : super(key: key);
  final List<T> items;
  final double width;
  final bool useDivider;
  final int? itemInRow;
  final double? itemHeight;
  final SliverGridDelegate? customGridDelegate;
  final EdgeInsetsGeometry? padding;
  final double itemRatio;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Column(
            children: [
              useDivider
                  ? const Divider(
                      thickness: 2,
                    )
                  : const SizedBox.shrink(),
              GridView.builder(
                itemCount: items.length,
                padding: padding,
                shrinkWrap: true,
                controller: ScrollController(keepScrollOffset: false),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: customGridDelegate ??
                    SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: itemRatio,
                        crossAxisCount: itemInRow ?? 5,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        mainAxisExtent: itemHeight ?? 200),
                itemBuilder: (context, index) =>
                    itemBuilder(context, items[index], index),
              )
            ],
          ),
        )
      ],
    );
  }
}
