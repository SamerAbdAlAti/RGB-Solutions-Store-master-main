import 'package:beamer/beamer.dart';
import 'package:card_loading/card_loading.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../../core/theme/app_theme.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/entities/product.dart';
import 'cubit/category_grid_widget_cubit.dart';
import 'widgets/product_grid_list.dart';
import 'widgets/radio_bar_category.dart';

class CategoryGridWidget extends StatefulWidget {
  const CategoryGridWidget({
    super.key,
    required this.fetch,
    required this.fetchMore,
    required this.itemBuilder,
    required this.onEmpty,
    this.onWaiting,
    required this.onError,
    required this.width,
    required this.itemHeight,
    this.gridItemRatio,
    this.margin,
    this.gridPadding,
    this.titleSeperator,
    this.buttonTextStyle,
    this.itemsInRow,
    this.isMobile = false,
  });
  final Future<List<Category>> fetch;
  final Future<Category> Function(
      String id, String channel, int amountOfProducts, String? after) fetchMore;
  final Widget Function(BuildContext context, Product item, int index)
      itemBuilder;
  final Widget onEmpty;
  final Widget? onWaiting;
  final Widget onError;
  final double width;
  final double itemHeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? gridPadding;
  final Widget? titleSeperator;
  final double? gridItemRatio;
  final int? itemsInRow;
  final ButtonTextStyle? buttonTextStyle;
  final bool isMobile;

  @override
  State<CategoryGridWidget> createState() => _CategoryGridWidgetState();
}

class _CategoryGridWidgetState extends State<CategoryGridWidget> {
  CategoryGridWidgetCubit? _cubit;
  final _buttonController = RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    _cubit = CategoryGridWidgetCubit(widget.fetch, widget.fetchMore)
      ..refreshGrid();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryGridWidgetCubit, CategoryGridWidgetState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.when(
            loading: () => widget.isMobile
                ? _buildMobileLoadingWidget()
                : _buildLoadingWidget(),
            loaded: (products, category) {
              _buttonController.reset();
              return products.isNotEmpty
                  ? _buildEntireWidget(context, category, products)
                  : _buildWidgetInGrid(widget.onEmpty, category);
            },
            fetching: (products, category) {
              _buttonController.start();
              return products.isNotEmpty
                  ? _buildEntireWidget(context, category, products)
                  : _buildWidgetInGrid(widget.onEmpty, category);
            },
            error: (e) => _buildWidgetInGrid(widget.onError, null),
            initial: () => _buildWidgetInGrid(widget.onEmpty, null));
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++)
              CardLoading(
                height: 30,
                width: 50,
                borderRadius: BorderRadius.circular(18),
                margin: const EdgeInsets.only(left: 15),
              ),
          ],
        ),
        ProductGridList<String>(
            items: const ['1', '2', '3', '4'],
            itemInRow: widget.itemsInRow,
            itemBuilder: (context, item, index) => CardLoading(
                  height: widget.itemHeight,
                  margin: const EdgeInsets.only(left: 20),
                  borderRadius: BorderRadius.circular(12),
                ),
            width: widget.width),
        const SizedBox(
          height: 20,
        ),
        CardLoading(
          height: 50,
          width: 150,
          borderRadius: BorderRadius.circular(18),
          margin: const EdgeInsets.only(left: 15),
        ),
      ],
    );
  }

  Widget _buildMobileLoadingWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++)
              CardLoading(
                height: 20,
                width: 50,
                borderRadius: BorderRadius.circular(18),
                margin: const EdgeInsets.only(right: 15),
              ),
          ],
        ),
        ProductGridList<String>(
            items: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
            itemInRow: widget.itemsInRow,
            itemBuilder: (context, item, index) => CardLoading(
                  height: widget.itemHeight,
                  margin: const EdgeInsets.only(right: 20),
                  borderRadius: BorderRadius.circular(12),
                ),
            width: widget.width),
        const SizedBox(
          height: 10,
        ),
        CardLoading(
          height: 20,
          width: 75,
          borderRadius: BorderRadius.circular(18),
          margin: const EdgeInsets.only(left: 15),
        ),
      ],
    );
  }

  Widget _buildEntireWidget(
      BuildContext context, Category category, List<Product> items) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        children: [
          _buildTopBar(context, category.id),
          _buildGridList(items),
          const SizedBox(
            height: 20,
          ),
          category.pageInfo!.hasNextPage
              ? RoundedLoadingButton(
                  controller: _buttonController,
                  color: StoreTheme.tentColor,
                  width: double.minPositive + 130,
                  onPressed: () => _cubit!.getMore(category),
                  child: const Text("تصفح باقي القائمة"))
              : ElevatedButton(
                  onPressed: () =>
                      Beamer.of(context).beamToNamed('/c/${category.id}'),
                  child: const Text("انتقل الى هذا التصنيف")),
        ],
      ),
    );
  }

  Widget _buildWidgetInGrid(Widget widgetToBuild, Category? category) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        children: [
          if (category != null) _buildTopBar(context, category.id),
          ProductGridList<String>(
            items: const ['1'],
            itemBuilder: (context, item, index) => widgetToBuild,
            width: widget.width,
            itemInRow: 1,
            itemRatio: 10 / 3,
            itemHeight: widget.itemHeight,
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, String setValue) {
    final btnValues = _cubit!.getValues();
    return RadioBarCategory(
      buttonLables: _cubit!.getLables(),
      buttonValues: btnValues,
      defaultButtonValue: setValue,
      customTextStyle: widget.buttonTextStyle,
      onValue: (value) => _cubit!.fetchItems(value),
    );
  }

  Widget _buildGridList(List<Product> items) {
    return ProductGridList(
      items: items,
      itemBuilder: widget.itemBuilder,
      width: widget.width,
      useDivider: true,
      itemInRow: widget.itemsInRow ??
          (MediaQuery.of(context).size.width * 0.75) ~/ 175,
      itemHeight: widget.itemHeight,
      padding: widget.gridPadding,
      itemRatio: widget.gridItemRatio ?? 6 / 5,
    );
  }
}
