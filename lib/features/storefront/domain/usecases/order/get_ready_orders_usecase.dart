// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart' hide Order;
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';

import '../../repositories/order_repository.dart';

@lazySingleton
class GetReadyOrdersUseCase
    implements UseCase<List<Order>, GetReadyOrdersParams> {
  final OrderRepository repository;

  GetReadyOrdersUseCase(this.repository);

  @override
  Future<Either<Failure, List<Order>>?> call(
      GetReadyOrdersParams params) async {
    return await repository.getReadyOrders(
        first: params.first, after: params.after);
  }
}

class GetReadyOrdersParams {
  int first;
  String? after;
  GetReadyOrdersParams({
    required this.first,
    this.after,
  });
}
