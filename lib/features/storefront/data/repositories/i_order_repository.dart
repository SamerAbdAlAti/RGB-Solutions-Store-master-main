// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart' hide Order;
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/local_auth_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';

import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasource/order_datasource.dart';
import '../models/user_model.dart';

@LazySingleton(as: OrderRepository)
class IOrderRepository implements OrderRepository {
  final OrderDatasource orderDatasource;
  final AuthLocalDatasource authLocalDatasource;
  IOrderRepository(this.orderDatasource, this.authLocalDatasource);

  @override
  Future<Either<Failure, Order>> placeOrder(
      {required User user,
      required String methodId,
      required List<Map<String, dynamic>> metadata}) async {
    try {
      final result = await orderDatasource.createOrder(
          id: user.checkouts.first.id,
          deliveryId: methodId,
          metadata: metadata);
      user.orders.add(result);
      user.checkouts.removeAt(0);
      await authLocalDatasource.saveUserData((user as UserModel).toJson());
      return Right(result);
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getReadyOrders(
      {required int first, String? after}) async {
    try {
      final result =
          await orderDatasource.getReadyOrders(first: first, after: after);
      return Right(result);
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    }
  }

  @override
  Future<Either<Failure, Order>> addNotes(
      {required String orderId, required String message}) async {
    try {
      final result =
          await orderDatasource.addNote(orderId: orderId, message: message);
      UserModel? user = await authLocalDatasource.getStoredUser();
      final currentOrderIndex =
          user!.orders.indexWhere((element) => element.id == orderId);
      user.orders.removeWhere((element) => element.id == orderId);
      user.orders.insert(currentOrderIndex, result);
      await authLocalDatasource.saveUserData(user.toJson());
      return Right(result);
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    } on StorageNotFoundException {
      return Left(StorageNotFoundFailure());
    }
  }
}
