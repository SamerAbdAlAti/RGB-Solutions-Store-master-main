import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/collection.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_filter.dart';
import '../../domain/repositories/storefront_repository.dart';
import '../datasource/storefront_remote_datasource.dart';

typedef _ListOrSingle<T> = Future<T> Function();

@LazySingleton(as: StorefrontRepository)
class IStorefrontRepository implements StorefrontRepository {
  final StorefrontRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  IStorefrontRepository(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Product>>> getProducts(
      {required int number,
      required String channel,
      String? before,
      String? after}) async {
    return await _getBody(
        () => remoteDataSource.getProducts(
            number: number, channel: channel, after: after, before: before),
        "pros");
  }

  @override
  Future<Either<Failure, Product>> getSingleProduct(
      String id, String channel) async {
    return await _getBody(
        () => remoteDataSource.getSingleProduct(id, channel), "single pro");
  }

  @override
  Future<Either<Failure, List<Category>>>? getCategories(
      {required int amount,
      required String channel,
      required int amountOfProducts,
      String? before,
      String? after}) async {
    return await _getBody(
        () => remoteDataSource.getCategories(
            amount: amount,
            channel: channel,
            amountOfProducts: amountOfProducts,
            after: after,
            before: before),
        "cats");
  }

  @override
  Future<Either<Failure, Category>>? getSingleCategory(
      {required String id,
      required String channel,
      required int amountOfProducts,
      String? before,
      String? after}) async {
    return await _getBody(
        () => remoteDataSource.getSingleCategory(
            id: id,
            channel: channel,
            amountOfProducts: amountOfProducts,
            after: after,
            before: before),
        "single cat");
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(
      String term, int amount) async {
    return await _getBody(
        () => remoteDataSource.searchProducts(term, amount), "search pro");
  }

  @override
  Future<Either<Failure, List<Category>>> searchCategories(
      String term, int amount) async {
    return await _getBody(
        () => remoteDataSource.searchCategories(term, amount), "search cats");
  }

  @override
  Future<Either<Failure, List<Collection>>> searchCollections(
      String term, int amount) async {
    return await _getBody(
        () => remoteDataSource.searchCollections(term, amount), "searc coll");
  }

  @override
  Future<Either<Failure, Category>> singleCategoryFiltered(
      {required String id,
      required String channel,
      required int amountOfProducts,
      required ProductFilter productFilter,
      String? before,
      String? after}) async {
    return await _getBody(
        () => remoteDataSource.singleCategoryFiltered(
            id: id,
            channel: channel,
            amountOfProducts: amountOfProducts,
            productFilter: productFilter,
            after: after,
            before: before),
        "single cat fil");
  }

  @override
  Future<Either<Failure, List<Collection>>>? getCollections(
      {required int amount,
      required int amountOfProducts,
      String? before,
      String? after}) async {
    return await _getBody(
        () => remoteDataSource.getCollections(
            amount: amount, amountOfProducts: amountOfProducts),
        "coll");
  }

  @override
  Future<Either<Failure, Collection>>? getSingleCollection(
      {required String id,
      required int amountOfProducts,
      String? before,
      String? after}) async {
    return await _getBody(
        () => remoteDataSource.getSingleCollection(
            id: id, amountOfProducts: amountOfProducts),
        "single coll");
  }

  Future<Either<Failure, T>> _getBody<T>(
      _ListOrSingle listOrSingle, String msg) async {
    try {
      networkInfo.isConnected;
      final remoteProduct = await listOrSingle();
      if (remoteProduct == null) {
        throw ServerException();
      }
      return Right(remoteProduct);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
