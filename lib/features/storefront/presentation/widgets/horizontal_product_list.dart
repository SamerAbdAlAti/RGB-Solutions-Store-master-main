import 'package:card_loading/card_loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HorizontalProductList<T> extends StatefulWidget {
  const HorizontalProductList({
    super.key,
    required this.itemBuilder,
    required this.fetch,
    required this.onEmpty,
    this.onWaiting,
    required this.onError,
    required this.tileWidth,
    required this.title,
    this.titleSeperator,
    this.padding = const EdgeInsets.all(12.0),
    this.listHeight = 230.0,
    this.paddingInsideList = false,
    this.buildErrorInsideList = false,
    this.controller,
  });
  final Future<List<T>> fetch;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget onEmpty;
  final Widget? onWaiting;
  final Widget onError;
  final Widget title;
  final double tileWidth;
  final EdgeInsetsGeometry padding;
  final double listHeight;
  final bool paddingInsideList;
  final Widget? titleSeperator;
  final bool buildErrorInsideList;
  final ScrollController? controller;

  @override
  State<HorizontalProductList<T>> createState() =>
      _HorizontalProductListState<T>();
}

class _HorizontalProductListState<T> extends State<HorizontalProductList<T>> {
  // late double _screenWidth;
  @override
  Widget build(BuildContext context) {
    // _screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder<List<T>>(
      future: widget.fetch,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return widget.buildErrorInsideList
              ? widget.onError
              : _buildListError(widget.onError);
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return widget.onWaiting ?? _buildDefaultLoadingWidget();
          case ConnectionState.done:
            final List<T>? items = snapshot.data;
            return items!.isNotEmpty
                ? _buildList(items)
                : _buildListError(widget.onEmpty);
          default:
            return widget.onEmpty;
        }
      },
    );
  }

  Widget _buildDefaultLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardLoading(
            height: 30,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            width: 100,
            margin: EdgeInsets.only(bottom: 10),
          ),
          Row(
            children: [
              for (int i = 0; i < 2; i++)
                CardLoading(
                  height: widget.listHeight,
                  width: widget.tileWidth,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  margin: const EdgeInsets.only(right: 10),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<T>? items) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title,
          widget.titleSeperator ??
              const SizedBox(
                height: 20,
              ),
          SizedBox(
            height: widget.listHeight,
            child: ScrollConfiguration(
              behavior: ProductScrollBehavior(),
              child: ListView.builder(
                controller: widget.controller,
                itemCount: items!.length,
                itemExtent: widget.tileWidth,
                shrinkWrap: true,
                padding: widget.paddingInsideList ? widget.padding : null,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    widget.itemBuilder(context, items[index], index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListError(Widget errorWidget) {
    return Padding(
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.listHeight,
            child: ScrollConfiguration(
              behavior: ProductScrollBehavior(),
              child: ListView(
                shrinkWrap: true,
                padding: widget.paddingInsideList ? widget.padding : null,
                scrollDirection: Axis.horizontal,
                children: [errorWidget],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // int get _getProductAmount => (_screenWidth ~/ widget.tileWidth);
}

class ProductScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.mouse, PointerDeviceKind.touch};
}
