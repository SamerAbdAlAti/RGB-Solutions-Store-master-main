import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../domain/entities/category.dart';
import '../../../../../../domain/entities/product.dart';

part 'single_category_grid_state.dart';
part 'single_category_grid_cubit.freezed.dart';

class SingleCategoryGridCubit extends Cubit<SingleCategoryGridState> {
  SingleCategoryGridCubit(this.pagination, this.category)
      : super(
            SingleCategoryGridState.initial(category.products ?? [], category));
  final Category category;
  final Future<Category> Function(
      String id, String channel, int amountOfProducts, String after) pagination;

  Future<void> getMore(Category currentCategory) async {
    try {
      emit(SingleCategoryGridState.fetching(
          currentCategory.products ?? [], currentCategory));
      final fetchedCategory = await pagination(currentCategory.id,
          "default-channel", 20, currentCategory.pageInfo!.endCursor);
      final List<Product> newProducts =
          currentCategory.products! + fetchedCategory.products!;
      fetchedCategory.products = newProducts;
      emit(SingleCategoryGridState.loaded(
          fetchedCategory.products ?? [], fetchedCategory));
    } on Exception catch (error) {
      emit(SingleCategoryGridState.error(error));
    }
  }
}
