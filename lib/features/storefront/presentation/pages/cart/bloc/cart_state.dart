part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial(Checkout? checkout) = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.ready(
      Checkout checkout, String title, String message) = _Ready;
  const factory CartState.readyOrder(Order order) = _ReadyOrder;
  const factory CartState.error(
      Checkout checkout, String title, String message) = _Error;
}
