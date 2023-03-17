part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started(Future<User> getUser) = _Started;
  const factory CartEvent.addItem(
      Future<User?> getUser, String variantId, int quantity) = _addItem;
  const factory CartEvent.deleteItem(
          Future<User> getUser, List<String> linesIds, String checkoutId) =
      _DeleteItem;
  const factory CartEvent.updateQuantity(Future<User> getUser, String lineId,
      String checkoutId, int quantity) = _UpdateQuantity;
  const factory CartEvent.updateAddress(
      Future<User?> user, Address address, String checkoutId) = _UpdateAddress;
  const factory CartEvent.placeOrder(Future<User?> user, String methodId,
      List<Map<String, String>> metadata) = _PlaceOrder;
  const factory CartEvent.removeCobon(
      Future<User> user, String checkoutId, String cobon) = _RemoveCobon;
  const factory CartEvent.addCobon(
      Future<User> user, String checkoutId, String cobon) = _AddCobon;
}
