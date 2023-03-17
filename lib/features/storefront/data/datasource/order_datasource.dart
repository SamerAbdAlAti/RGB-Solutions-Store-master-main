import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide ServerException;
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/graphql/order/order_mutations.dart';
import 'package:saleor_app_flutter/core/graphql/order/order_query.dart';
import 'package:saleor_app_flutter/core/utl/secrets.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/order_model.dart';

abstract class OrderDatasource {
  Future<OrderModel> addNote(
      {required String orderId, required String message});

  Future<OrderModel> createOrder(
      {required String id,
      required String deliveryId,
      required List<Map<String, dynamic>> metadata});

  Future<List<OrderModel>> getReadyOrders({required int first, String? after});
}

@LazySingleton(as: OrderDatasource)
class IOrderDatasource implements OrderDatasource {
  final _superClient = GraphQLClient(
      link: Constants.authLink, cache: GraphQLCache(store: InMemoryStore()));

  @override
  Future<OrderModel> addNote(
      {required String orderId, required String message}) async {
    try {
      QueryResult<Object?> result = await _superClient.mutate(
        MutationOptions(
            document: gql(OrderMutations.addEvent),
            variables: {'orderId': orderId, 'message': message}),
      );
      if (result.hasException) {
        throw InformationException(
            message: "حدث خطأ اثناء التواصل مع السيرفر.");
      }
      // if (result.data!['errors'].isNotEmpty) {
      //   throw InformationException(message: result.data!['errors']['message']);
      // }
      return OrderModel.fromMap(result.data!['orderAddNote']['order']);
    } on InformationException catch (error) {
      debugPrint("addNote: ${error.message}");
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<OrderModel> createOrder(
      {required String id,
      required String deliveryId,
      required List<Map<String, dynamic>> metadata}) async {
    try {
      QueryResult<Object?> result = await _superClient.mutate(
        MutationOptions(document: gql(OrderMutations.putOrder), variables: {
          'id': id,
          'deliveryId': deliveryId,
          'metadata': metadata
        }),
      );
      if (result.hasException) {
        throw InformationException(
            message: "حدث خطأ اثناء التواصل مع السيرفر.");
      }
      // if (result.data!['errors'].isNotEmpty) {
      //   throw InformationException(message: result.data!['errors']['message']);
      // }
      return OrderModel.fromMap(
          result.data!['orderCreateFromCheckout']['order']);
    } on InformationException catch (error) {
      debugPrint("createOrder: ${error.message}");
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderModel>> getReadyOrders(
      {required int first, String? after}) async {
    try {
      QueryResult<Object?> result = await _superClient.query(
        QueryOptions(
            document: gql(OrderQuery.getReadyOrders),
            variables: {'first': first, 'after': after}),
      );
      if (result.hasException) {
        throw InformationException(
            message: "حدث خطأ اثناء التواصل مع السيرفر.");
      }
      return result.data!['orders']['edges']
          .map((e) => OrderModel.fromMap(e['node']))
          .cast<OrderModel>()
          .toList();
    } on InformationException catch (error) {
      debugPrint("getReadyOrders: ${error.message}");
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }
}
