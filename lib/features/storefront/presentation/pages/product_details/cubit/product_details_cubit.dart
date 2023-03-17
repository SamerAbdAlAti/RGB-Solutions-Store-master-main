import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/product.dart';

part 'product_details_cubit.freezed.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.callback)
      : super(const ProductDetailsState.initial());
  final Future<Product> callback;

  Future initCubit() async {
    try {
      emit(const ProductDetailsState.loading());
      Product product = await callback;
      if (product == null) {
        emit(const ProductDetailsState.onError('null'));
      } else {
        emit(ProductDetailsState.loaded(product));
      }
    } on Exception catch (error) {
      emit(ProductDetailsState.onError(error));
    }
  }
}
