import 'package:dartz/dartz.dart' hide Order;
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';

abstract class OrderRepository {
  Future<Either<Failure, Order>> placeOrder(
      {required User user, required String methodId, required List<Map<String, dynamic>> metadata});

  Future<Either<Failure, Order>> addNotes(
      {required String orderId, required String message});

  Future<Either<Failure, List<Order>>> getReadyOrders(
      {required int first, String? after});
}
