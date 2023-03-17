// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart' hide Order;
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';

import '../../repositories/order_repository.dart';

@lazySingleton
class PlaceOrderUseCase implements UseCase<Order, PlaceOrderParams> {
  final OrderRepository repository;

  PlaceOrderUseCase(this.repository);
  @override
  Future<Either<Failure, Order>?> call(PlaceOrderParams params) async =>
      await repository.placeOrder(user: params.user, methodId: params.methodId, metadata: params.metadata);
}

class PlaceOrderParams {
  User user;
  String methodId;
  List<Map<String, dynamic>> metadata;
  PlaceOrderParams({
    required this.user,
    required this.methodId,
    required this.metadata,
  });
}
