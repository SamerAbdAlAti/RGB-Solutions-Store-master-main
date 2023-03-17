part of 'category_grid_widget_cubit.dart';

@freezed
class CategoryGridWidgetState with _$CategoryGridWidgetState {
  const factory CategoryGridWidgetState.initial() = _Initial;
  const factory CategoryGridWidgetState.loading() = _Loading;
  const factory CategoryGridWidgetState.loaded(
    List<Product> products,
    Category category,
  ) = _Loaded;
  const factory CategoryGridWidgetState.fetching(
    List<Product> products,
    Category category,
  ) = _Fetching;
  const factory CategoryGridWidgetState.error(dynamic error) = _Error;
}
