import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/types/payment_charge_status_enum.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/order/add_notes_usercase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/order/get_ready_orders_usecase.dart';

import '../../../../../../core/error/exceptions.dart';

part 'delivery_state.dart';
part 'delivery_cubit.freezed.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  final AddNotesUseCase addNotesUseCase;
  final GetReadyOrdersUseCase getReadyOrdersUseCase;

  DeliveryCubit(this.addNotesUseCase, this.getReadyOrdersUseCase)
      : super(const DeliveryState.initial());

  Future<void> getReadyOrders(int first) async {
    try {
      emit(const DeliveryState.loading());
      final either =
          await getReadyOrdersUseCase(GetReadyOrdersParams(first: first));
      return await either!.fold((l) => throw _getFailureAndThrowException(l),
          (r) {
        emit(DeliveryState.ready(_filteringPayment(r)));
      });
    } on Exception {
      emit(const DeliveryState.error());
    }
  }

  Future<void> getPayedOrders(int first) async {
    try {
      emit(const DeliveryState.loading());
      final either =
          await getReadyOrdersUseCase(GetReadyOrdersParams(first: first));
      return await either!.fold((l) => throw _getFailureAndThrowException(l),
          (r) => emit(DeliveryState.ready(_filterReadyOrders(r))));
    } on Exception {
      emit(const DeliveryState.error());
    }
  }

  List<Order> _filteringPayment(List<Order> orders) {
    return orders
        .where((element) =>
            element.paymentStatus == PaymentChargeStatusEnum.NOT_CHARGED)
        .toList();
  }

  List<Order> _filterReadyOrders(List<Order> orders) {
    return orders
        .where((element) =>
            element.paymentStatus == PaymentChargeStatusEnum.FULLY_CHARGED)
        .toList();
  }

  Exception _getFailureAndThrowException(Failure l) {
    switch (l.runtimeType) {
      case ServerFailure:
        return ServerException();
      case CacheFailure:
        return CacheException();
      case InformationFailure:
        final fail = l as InformationFailure;
        return InformationException(message: fail.message);
      case StorageNotFoundFailure:
        return StorageNotFoundException();
      default:
        return UnexpectedException();
    }
  }
}
