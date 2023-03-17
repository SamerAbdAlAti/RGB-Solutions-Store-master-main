part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.placeOrder(
      Future<User> user,String methodId, List<Map<String, String>> metadata) = _PlaceOrder;
}
