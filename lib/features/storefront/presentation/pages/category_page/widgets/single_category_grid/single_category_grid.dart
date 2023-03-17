import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../domain/entities/category.dart';
import '../../../../../domain/entities/product.dart';
import 'cubit/single_category_grid_cubit.dart';
import '../../../../widgets/category_grid_widget/widgets/product_grid_list.dart';

class SingleCategoryGrid extends StatefulWidget {
  const SingleCategoryGrid(
      {super.key,
      required this.category,
      required this.pagination,
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
      this.itemInRow = 4,
      this.isMobile = false,
      this.useDivider = true});
  final Category category;
  final Future<Category> Function(
      String id, String channel, int amountOfProducts, String after) pagination;
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
  final int itemInRow;
  final bool isMobile;
  final bool useDivider;

  @override
  State<SingleCategoryGrid> createState() => _SingleCategoryGridState();
}

class _SingleCategoryGridState extends State<SingleCategoryGrid> {
  SingleCategoryGridCubit? _cubit;
  final _buttonController = RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    _cubit = SingleCategoryGridCubit(widget.pagination, widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleCategoryGridCubit, SingleCategoryGridState>(
      bloc: _cubit,
      builder: (context, state) {
        return state.when(
            loading: () => _buildLoadingWidget(),
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
            initial: (products, category) {
              _buttonController.reset();
              return products.isNotEmpty
                  ? _buildEntireWidget(context, category, products)
                  : _buildWidgetInGrid(widget.onEmpty, category);
            });
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
                width: 100,
                borderRadius: BorderRadius.circular(18),
                margin: const EdgeInsets.only(left: 15),
              ),
          ],
        ),
        ProductGridList<String>(
            items: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
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
          height: 30,
          width: 150,
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
          _buildTopBar(category),
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
                  // _cubit!.getMore(category)
                  child: const Text("تصفح باقي القائمة"))
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildWidgetInGrid(Widget widgetToBuild, Category? category) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: Column(
        children: [
          if (category != null) _buildTopBar(category),
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

  Widget _buildTopBar(Category category) {
    return Text(
      '',
      style: widget.isMobile
          ? Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.bold)
          : null,
    );
  }

  Widget _buildGridList(List<Product> items) {
    return ProductGridList(
      items: items,
      itemBuilder: widget.itemBuilder,
      width: widget.width,
      useDivider: widget.useDivider,
      itemHeight: widget.itemHeight,
      itemInRow: widget.itemInRow,
      padding: widget.gridPadding,
      itemRatio: widget.gridItemRatio ?? 6 / 5,
    );
  }
}
