// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/graphql/public_query.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/category_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/collection_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/page_info_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/collection.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product_filter.dart';

abstract class StorefrontRemoteDatasource {
  /// Calls the Graphql API endpoint.
  ///
  /// Throws a [ServerException] for all errors;
  Future<List<ProductModel>> getProducts(
      {required int number,
      required String channel,
      String? before,
      String? after});

  /// Calls the Graphql API endpoint.
  ///
  /// Throws a [ServerException] for all errors;
  Future<ProductModel?> getSingleProduct(String id, String channel);

  Future<List<ProductModel>> searchProducts(String term, int amount);
  Future<List<CategoryModel>> searchCategories(String term, int amount);
  Future<List<CollectionModel>> searchCollections(String term, int amount);

  /// Calls the Graphql API endpoint.
  ///
  /// Throws a [ServerException] for all errors;
  Future<List<CategoryModel>> getCategories(
      {required int amount,
      required String channel,
      required int amountOfProducts,
      String? before,
      String? after});

  Future<CategoryModel?> getSingleCategory(
      {required String id,
      required String channel,
      required int amountOfProducts,
      String? before,
      String? after});

  Future<List<Collection>> getCollections(
      {required int amount,
      required int amountOfProducts,
      String? before,
      String? after});

  Future<Collection?> getSingleCollection(
      {required String id,
      required int amountOfProducts,
      String? before,
      String? after});

  Future<CategoryModel?> singleCategoryFiltered(
      {required String id,
      required String channel,
      required int amountOfProducts,
      required ProductFilter productFilter,
      String? before,
      String? after});
}

@LazySingleton(as: StorefrontRemoteDatasource)
class IStorefrontRemoteDatasource implements StorefrontRemoteDatasource {
  final GraphQLClient _client;
  IStorefrontRemoteDatasource(this._client);

  @override
  Future<List<ProductModel>> getProducts(
      {required int number,
      required String channel,
      String? before,
      String? after}) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.productsQuery,
          variables: {
            "first": number,
            "channel": channel,
            "before": before,
            "after": after
          }));
      if (result.data == null) return [];
      PageInfoModel pageInfoModel =
          PageInfoModel.fromMap(result.data!['products']);
      return result.data?['products']['edges']
          .map((e) => ProductModel.fromMap(e['node'], pageInfoModel))
          .cast<ProductModel>()
          .toList();
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote getProducts: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<ProductModel?> getSingleProduct(String id, String channel) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.singleProductQuery,
          variables: {"id": id, "channel": channel}));
      if (result.data == null) return null;
      if (result.data?['product'] == null) return null;
      return ProductModel.fromMap(result.data?['product'], null);
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote getSingleProducts: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<List<CategoryModel>> getCategories(
      {required int amount,
      required String channel,
      required int amountOfProducts,
      String? before,
      String? after}) async {
    try {
      final result = await _client.query(
          QueryOptions(document: PublicGQLQuery.categoriesQuery, variables: {
        "amount": amount,
        "channel": channel,
        "amountOfProducts": amountOfProducts,
        "before": before,
        "after": after
      }));
      if (result.data == null) return [];
      final pageInfoModel = PageInfoModel.fromMap(result.data!['categories']);
      return result.data!['categories']['edges']
          .map((e) => CategoryModel.fromMap(e['node'], pageInfoModel))
          .cast<CategoryModel>()
          .toList();
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote getCategories: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<CategoryModel?> getSingleCategory(
      {required String id,
      required String channel,
      required int amountOfProducts,
      String? before,
      String? after}) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.singleCategoryQuery,
          variables: {
            "id": id,
            "channel": channel,
            "amountOfProducts": amountOfProducts,
            "before": before,
            "after": after
          }));
      if (result.data == null) return null;
      final pageInfo =
          PageInfoModel.fromMap(result.data!['category']['products']);
      return CategoryModel.fromMap(result.data!['category'], pageInfo);
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote getSingleCategory: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String term, int amount) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.productSearch,
          variables: {"amount": amount, "term": term}));
      if (result.data == null) return [];
      return result.data?['products']['edges']
          .map((e) => ProductModel.fromMap(e['node'], null))
          .cast<ProductModel>()
          .toList();
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote searchProducts: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<CategoryModel?> singleCategoryFiltered(
      {required String id,
      required String channel,
      required int amountOfProducts,
      required ProductFilter productFilter,
      String? before,
      String? after}) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.singleCategoryFiltered,
          variables: {
            "id": id,
            "channel": channel,
            "amountOfProducts": amountOfProducts,
            "gte": productFilter.greaterThan,
            "lte": productFilter.lowerThan,
            "direction": productFilter.direction,
            "field": productFilter.fields,
            "before": before,
            "after": after
          }));
      if (result.data == null) return null;
      final pageInfo =
          PageInfoModel.fromMap(result.data!['category']['products']);
      return CategoryModel.fromMap(result.data!['category'], pageInfo);
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote getSingleCategory: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<List<Collection>> getCollections(
      {required int amount,
      required int amountOfProducts,
      String? before,
      String? after}) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.multiCollectionQuery,
          variables: {
            "amount": amount,
            "amountOfProducts": amountOfProducts,
            "before": before,
            "after": after
          }));
      if (result.data == null) return [];
      final pageInfoModel = PageInfoModel.fromMap(result.data!['collections']);
      return result.data!['collections']['edges']
          .map((e) => CollectionModel.fromMap(e['node'], pageInfoModel))
          .cast<CollectionModel>()
          .toList();
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote getCollections: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<Collection?> getSingleCollection(
      {required String id,
      required int amountOfProducts,
      String? before,
      String? after}) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.singleCollectionQuery,
          variables: {
            "id": id,
            "amountOfProducts": amountOfProducts,
            "before": before,
            "after": after
          }));
      if (result.data == null) return null;
      final pageInfo =
          PageInfoModel.fromMap(result.data!['collection']['products']);
      return CollectionModel.fromMap(result.data!['collection'], pageInfo);
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote getSingleCollection: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<List<CategoryModel>> searchCategories(String term, int amount) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.categorySearch,
          variables: {"amount": amount, "term": term}));
      if (result.data == null) return [];
      return result.data?['categories']['edges']
          .map((e) => CategoryModel.fromMap(e['node'], null))
          .cast<CategoryModel>()
          .toList();
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote searchCategories: $exception");
      throw ServerFailure();
    }
  }

  @override
  Future<List<CollectionModel>> searchCollections(
      String term, int amount) async {
    try {
      final result = await _client.query(QueryOptions(
          document: PublicGQLQuery.collectionSearch,
          variables: {"amount": amount, "term": term}));
      if (result.data == null) return [];
      return result.data?['collections']['edges']
          .map((e) => CollectionModel.fromMap(e['node'], null))
          .cast<CollectionModel>()
          .toList();
    } on Exception catch (exception) {
      if (kDebugMode) print("Error remote searchCollections: $exception");
      throw ServerFailure();
    }
  }
}
