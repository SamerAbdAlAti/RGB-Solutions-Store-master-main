// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart' hide Order;

import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';

import '../../repositories/order_repository.dart';

@lazySingleton
class AddNotesUseCase implements UseCase<Order, AddNotesParams> {
  final OrderRepository repository;

  AddNotesUseCase(this.repository);

  @override
  Future<Either<Failure, Order>?> call(AddNotesParams params) async {
    return await repository.addNotes(
        orderId: params.orderId, message: params.message);
  }
}

class AddNotesParams {
  String orderId;
  String message;
  AddNotesParams({
    required this.orderId,
    required this.message,
  });
}
