import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/category.dart';
import '../../../../domain/entities/product.dart';

part 'category_grid_widget_state.dart';
part 'category_grid_widget_cubit.freezed.dart';

class CategoryGridWidgetCubit extends Cubit<CategoryGridWidgetState> {
  CategoryGridWidgetCubit(this.callback, this.fetchMore)
      : super(const CategoryGridWidgetState.initial());
  final Future<List<Category>> callback;
  final Future<Category> Function(
      String id, String channel, int amountOfProducts, String? after) fetchMore;
  late List<Category> items = const [];

  Future<void> fetchItems(String value) async {
    try {
      emit(const CategoryGridWidgetState.loading());
      final category = _getCategory(value);

      emit(CategoryGridWidgetState.loaded(category.products ?? [], category));
    } on Exception catch (error) {
      emit(CategoryGridWidgetState.error(error));
    }
  }

  Future refreshGrid() async {
    try {
      emit(const CategoryGridWidgetState.loading());
      items = await callback;
      emit(CategoryGridWidgetState.loaded(items[0].products ?? [], items[0]));
    } on Exception catch (error) {
      emit(CategoryGridWidgetState.error(error));
    }
  }

  Future getMore(Category category) async {
    try {
      emit(CategoryGridWidgetState.fetching(category.products ?? [], category));
      final currentCategory = await fetchMore(
          category.id, "default-channel", category.products!.length, null);
      if (currentCategory.pageInfo!.hasNextPage) {
        Category newFetch = await fetchMore(
            currentCategory.id,
            "default-channel",
            currentCategory.products!.length + 20,
            currentCategory.pageInfo!.endCursor);
        List<Product> oldProducts = currentCategory.products ?? [];
        List<Product> newProducts = newFetch.products ?? [];
        newFetch.products = oldProducts += newProducts;
        emit(CategoryGridWidgetState.loaded(newFetch.products ?? [], newFetch));
      } else {
        emit(CategoryGridWidgetState.loaded(
            currentCategory.products ?? [], currentCategory));
      }
    } on Exception catch (error) {
      if (kDebugMode) print("Error in CategoryGrid fetching data: $error");
      emit(CategoryGridWidgetState.error(error));
    }
  }

  List<String> getLables() {
    return items.map((e) => e.name).cast<String>().toList();
  }

  List<String> getValues() {
    return items.map((e) => e.id).cast<String>().toList();
  }

  Category _getCategory(String value) {
    return items.firstWhere((element) => element.id == value);
  }
}
