import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../../../core/types/route_type.dart';
import '../../../../../../domain/entities/poster.dart';
import '../../../../../../domain/entities/product.dart';

part 'snaplist_poster_state.dart';
part 'snaplist_poster_cubit.freezed.dart';

class SnaplistPosterCubit extends Cubit<SnaplistPosterState> {
  SnaplistPosterCubit() : super(const SnaplistPosterState.initial());

  Future<void> fetchData(Future<List<Poster>> fetchPoster,
      Future<Product> Function(String id, String channel) fetchProduct) async {
    try {
      emit(const SnaplistPosterState.loading());
      final posters = await fetchPoster;
      final products = await _getProduct(posters, fetchProduct);
      emit(SnaplistPosterState.loaded(posters, products));
    } on Exception catch (error) {
      if (kDebugMode) print("Error in Snaplist Cubit: $error");
      emit(SnaplistPosterState.error(error));
    }
  }

  Future<List<Product>> _getProduct(List<Poster> posters,
      Future<Product> Function(String id, String channel) fetchProduct) async {
    try {
      List<Product> products = [];
      for (var element in posters) {
        Product pro = await fetchProduct(element.routeId, "default-channel");
        products.add(pro);
      }
      return products;
    } on Exception catch (error) {
      if (kDebugMode) print("Error in Snaplist Cubit: $error");
      emit(SnaplistPosterState.error(error));
      return [];
    }
  }

  String routeTo(Poster poster) {
    switch (poster.routeType) {
      case RouteType.product:
        return "/p/${poster.routeId}";
      case RouteType.category:
        return "/c/${poster.routeId}";
      case RouteType.collection:
        return "/cl/${poster.routeId}";
      case RouteType.unclickable:
        return '';
    }
  }
}
