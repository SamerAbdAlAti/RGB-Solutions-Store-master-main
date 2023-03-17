part of 'single_category_grid_cubit.dart';

@freezed
class SingleCategoryGridState with _$SingleCategoryGridState {
  const factory SingleCategoryGridState.initial(
    List<Product> products,
    Category category,
  ) = _Initial;
  const factory SingleCategoryGridState.loading() = _Loading;
  const factory SingleCategoryGridState.loaded(
    List<Product> products,
    Category category,
  ) = _Loaded;
  const factory SingleCategoryGridState.fetching(
    List<Product> products,
    Category category,
  ) = _Fetching;
  const factory SingleCategoryGridState.error(dynamic error) = _Error;
}
