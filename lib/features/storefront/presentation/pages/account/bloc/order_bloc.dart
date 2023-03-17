import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/order/place_order_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final PlaceOrderUseCase _placeOrderUseCase;
  OrderBloc(this._placeOrderUseCase) : super(const _Initial()) {
    on<OrderEvent>((event, emit) async {
      await event.map(
        placeOrder: (value) async {
          try {
            final user = await value.user;
            final result =
                await placeOrder(user, value.methodId, value.metadata);
            emit(OrderState.ready(result));
          } on InformationException catch (error) {
            emit(OrderState.error(error.message));
          } on Exception {
            emit(const OrderState.error('nouser'));
          }
        },
      );
    });
  }
  Future<Order> placeOrder(
      User user, String methodId, List<Map<String, String>> metadata) async {
    final either = await _placeOrderUseCase(
        PlaceOrderParams(user: user, methodId: methodId, metadata: metadata));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
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
