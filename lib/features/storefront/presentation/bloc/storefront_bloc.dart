// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/collection.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product_filter.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_categories_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_collections_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_products_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_category_filtered.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_category_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_collection_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_product_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/search_categories_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/search_collections_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/search_products_usecase.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/product.dart';

part 'storefront_bloc.freezed.dart';
part 'storefront_event.dart';
part 'storefront_state.dart';

@injectable
class StorefrontBloc extends Bloc<StorefrontEvent, StorefrontState> {
  final GetProductsUseCase _getMutipleProducts;
  final GetSingleProductUseCase _getSingleProduct;
  final GetCategoriesUseCase _getMultipleCategories;
  final GetSingleCategoryUseCase _getSingleCategory;
  final GetSingleCategoryFilteredUseCase _singleCategoryFiltered;
  final SearchProdcutsUseCase _searchProdcuts;
  final SearchCategoriesUseCase _searchCategories;
  final SearchCollectionsUseCase _searchCollections;
  final GetSingleCollectionUseCase _singleCollectionUseCase;
  final GetCollectionsUseCase _collectionsUseCase;

  StorefrontBloc(
      this._getMutipleProducts,
      this._getSingleProduct,
      this._getMultipleCategories,
      this._getSingleCategory,
      this._searchProdcuts,
      this._singleCollectionUseCase,
      this._collectionsUseCase,
      this._singleCategoryFiltered,
      this._searchCategories,
      this._searchCollections)
      : super(const _Initial()) {
    on<StorefrontEvent>((event, emit) {
      if (event is _Started) {
        emit(const StorefrontState.initial());
      }
    });
  }
  Future<List<Product>> getProducts(
      {required int amount,
      required String channel,
      String? after,
      String? before}) async {
    final either = await _getMutipleProducts(ProductsPrams(
        number: amount, channel: channel, after: after, before: before));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<List<Product>> searchProducts({
    required String term,
    required int amount,
  }) async {
    final either =
        await _searchProdcuts(SearchPrams(term: term, amount: amount));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<List<Category>> searchCategories({
    required String term,
    required int amount,
  }) async {
    final either =
        await _searchCategories(SearchPrams(term: term, amount: amount));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<List<Collection>> searchCollections({
    required String term,
    required int amount,
  }) async {
    final either =
        await _searchCollections(SearchPrams(term: term, amount: amount));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Product> getSingleProduct(String id, String channel) async {
    final either = await _getSingleProduct(SingleProductPrams(id, channel));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Category> getSingleFilteredCategory(
      {required String id,
      required String channel,
      required int amountOfProducts,
      required ProductFilter productFilter,
      String? after,
      String? before}) async {
    final either = await _singleCategoryFiltered(FilterSingleCategoryParams(
        id: id,
        channel: channel,
        amountOfProducts: amountOfProducts,
        productFilter: productFilter,
        after: after,
        before: before));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<List<Category>> getCategories(
      {required int amount,
      required String channel,
      required int amountOfProducts,
      String? after,
      String? before}) async {
    final either = await _getMultipleCategories(CategoriesPrams(
        amount: amount,
        channel: channel,
        amountOfProducts: amountOfProducts,
        after: after,
        before: before));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Category> getSingleCategory(
      {required String id,
      required String channel,
      required int amountOfProducts,
      String? after,
      String? before}) async {
    final either = await _getSingleCategory(CategoryParams(
        id: id,
        channel: channel,
        amountOfProducts: amountOfProducts,
        after: after,
        before: before));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<List<Collection>> getCollections(
      {required int amount,
      required int amountOfProducts,
      String? after,
      String? before}) async {
    final either = await _collectionsUseCase(CollectionParams(
        amount: amount,
        amountOfProducts: amountOfProducts,
        after: after,
        before: before));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Collection> getSingleCollection(
      {required String id,
      required int amountOfProducts,
      String? after,
      String? before}) async {
    final either = await _singleCollectionUseCase(SingleCollectionParams(
        id: id,
        amountOfProducts: amountOfProducts,
        after: after,
        before: before));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<List<Product>> getCalculatedAmount(
      {required double productWidth,
      required double screenWidth,
      required String channel,
      String? after,
      String? before}) async {
    final amount = (screenWidth ~/ productWidth);
    final either = await _getMutipleProducts(ProductsPrams(
        number: amount, channel: channel, after: after, before: before));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Exception _getFailureAndThrowException(Failure l) {
    switch (l.runtimeType) {
      case ServerFailure:
        return ServerException();
      case CacheFailure:
        return CacheException();
      default:
        return UnexpectedException();
    }
  }
}
