import 'package:dartz/dartz.dart';
import '../entities/collection.dart';
import '../entities/product_filter.dart';

import '../../../../core/error/failures.dart';
import '../entities/category.dart';
import '../entities/product.dart';

abstract class StorefrontRepository {
  Future<Either<Failure, List<Product>>>? getProducts(
      {required int number,
      required String channel,
      String? before,
      String? after});

  Future<Either<Failure, Product>>? getSingleProduct(String id, String channel);

  Future<Either<Failure, List<Category>>>? getCategories(
      {required int amount,
      required String channel,
      required int amountOfProducts,
      String? before,
      String? after});

  Future<Either<Failure, List<Collection>>>? getCollections(
      {required int amount,
      required int amountOfProducts,
      String? before,
      String? after});

  Future<Either<Failure, Collection>>? getSingleCollection(
      {required String id,
      required int amountOfProducts,
      String? before,
      String? after});

  Future<Either<Failure, Category>>? getSingleCategory(
      {required String id,
      required String channel,
      required int amountOfProducts,
      String? before,
      String? after});

  Future<Either<Failure, Category>> singleCategoryFiltered(
      {required String id,
      required String channel,
      required int amountOfProducts,
      required ProductFilter productFilter,
      String? before,
      String? after});

  Future<Either<Failure, List<Product>>> searchProducts(
      String term, int amount);
  Future<Either<Failure, List<Category>>> searchCategories(
      String term, int amount);
  Future<Either<Failure, List<Collection>>> searchCollections(
      String term, int amount);
}
