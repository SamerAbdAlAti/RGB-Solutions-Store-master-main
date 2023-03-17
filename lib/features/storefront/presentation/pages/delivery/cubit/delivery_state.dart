part of 'delivery_cubit.dart';

@freezed
class DeliveryState with _$DeliveryState {
  const factory DeliveryState.initial() = _Initial;
  const factory DeliveryState.loading() = _Loading;
  const factory DeliveryState.ready(List<Order> orders) = _Ready;
  const factory DeliveryState.error() = _Error;
}
