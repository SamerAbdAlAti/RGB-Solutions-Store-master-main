import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/add_cobon_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/add_to_cart_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/remove_cobon_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/remove_from_cart_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/update_checkout_address_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/update_product_to_cart.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/order/place_order_usecase.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartUsecase _addToCart;
  final UpdateProductToCartUsecase _updateProductToCart;
  final RemoveFromCartUsecase _removeFromCart;
  final UpdateCheckoutAddressUseCase _addressUseCase;
  final PlaceOrderUseCase _placeOrderUseCase;
  final AddCobonUseCase _addCobonUseCase;
  final RemoveCobonUseCase _removeCobonUseCase;

  CartBloc(
      this._addToCart,
      this._updateProductToCart,
      this._removeFromCart,
      this._addressUseCase,
      this._placeOrderUseCase,
      this._addCobonUseCase,
      this._removeCobonUseCase)
      : super(const _Initial(null)) {
    on<CartEvent>((event, emit) async {
      await event.map(
        started: (value) async {
          final result = await value.getUser;

          try {
            emit(const CartState.loading());
            emit(CartState.ready(result.checkouts.first, 'معلومات المستخدم',
                'تم طلب واستلام معلومات المستخدم'));
            await _resetBloc(emit, null);
          } on InformationException catch (error) {
            emit(CartState.error(result.checkouts.first, "خطأ", error.message));
          } on StorageNotFoundException {
            emit(CartState.error(result.checkouts.first, "خطأ", 'nouser'));
          }
        },
        placeOrder: (value) async {
          final user = await value.user;

          try {
            emit(const CartState.loading());
            final result =
                await placeOrder(user!, value.methodId, value.metadata);
            emit(CartState.readyOrder(result));
          } on InformationException catch (error) {
            emit(CartState.error(user!.checkouts.first, "خطأ", error.message));
          } on Exception {
            emit(CartState.error(user!.checkouts.first, "خطأ", 'nouser'));
          }
          await _resetBloc(emit, null);
        },
        addItem: (value) async {
          final user = await value.getUser;

          try {
            emit(const CartState.loading());
            final result =
                await addToCart(user!, value.variantId, value.quantity);
            await _resetBloc(emit, result);
            emit(CartState.ready(result, 'اضافة', 'تم اضافة منتج الى السلة'));
          } on InformationException catch (error) {
            emit(CartState.error(user!.checkouts.first, "خطأ", error.message));
          } on StorageNotFoundException {
            emit(CartState.error(user!.checkouts.first, "خطأ", 'nouser'));
          } on Exception {
            emit(CartState.error(user!.checkouts.first, "خطأ", 'nouser'));
          }
        },
        deleteItem: (value) async {
          User user = await value.getUser;

          try {
            emit(const CartState.loading());
            final result =
                await removeFromCart(user, value.linesIds, value.checkoutId);
            user = await value.getUser;
            emit(CartState.ready(result, "حذف", "تم حذف المنتج من السلة"));

            await _resetBloc(emit, result);
          } on InformationException catch (error) {
            emit(CartState.error(user.checkouts.first, "خطأ", error.message));
          } on StorageNotFoundException {
            emit(CartState.error(user.checkouts.first, "خطأ", 'nouser'));
          }
        },
        updateQuantity: (value) async {
          final user = await value.getUser;

          try {
            emit(const CartState.loading());
            final result = await updateQuantity(
                user, value.lineId, value.checkoutId, value.quantity);
            emit(CartState.ready(result, "الكمية", "تم تحديث كمية المنتج"));

            await _resetBloc(emit, result);
          } on InformationException catch (error) {
            emit(CartState.error(user.checkouts.first, "خطأ", error.message));
          } on StorageNotFoundException {
            emit(CartState.error(user.checkouts.first, "خطأ", 'nouser'));
          }
        },
        updateAddress: (value) async {
          final user = await value.user;

          try {
            emit(const CartState.loading());
            final result =
                await updateAddress(user!, value.address, value.checkoutId);
            emit(CartState.ready(result, "العنوان", "تم تحديث العنوان"));
            await _resetBloc(emit, result);
          } on InformationException catch (error) {
            emit(CartState.error(user!.checkouts.first, "خطأ", error.message));
          } on StorageNotFoundException {
            emit(CartState.error(user!.checkouts.first, "خطأ", 'nouser'));
          }
        },
        addCobon: (_AddCobon value) async {
          final user = await value.user;

          try {
            emit(const CartState.loading());
            final result = await addCobon(user, value.checkoutId, value.cobon);
            emit(CartState.ready(result, "كوبون خصم", "تم تطبيق كوبون الخصم"));
            // await _resetBloc(emit, result);
          } on InformationException catch (error) {
            emit(CartState.error(user.checkouts.first, "خطأ", error.message));
          } on StorageNotFoundException {
            emit(CartState.error(user.checkouts.first, "خطأ", 'nouser'));
          }
        },
        removeCobon: (value) async {
          final user = await value.user;

          try {
            emit(const CartState.loading());
            final result =
                await removeCobon(user, value.checkoutId, value.cobon);
            emit(CartState.ready(result, "كوبون خصم", "تم حذف كوبون الخصم"));
            await _resetBloc(emit, result);
          } on InformationException catch (error) {
            emit(CartState.error(user.checkouts.first, "خطأ", error.message));
          } on StorageNotFoundException {
            emit(CartState.error(user.checkouts.first, "خطأ", 'nouser'));
          }
        },
      );
    });
  }

  Future<Checkout> removeCobon(
      User user, String checkoutId, String cobon) async {
    final either = await _removeCobonUseCase(
        CobonParams(checkoutId: checkoutId, cobon: cobon, user: user));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Checkout> addCobon(User user, String checkoutId, String cobon) async {
    final either = await _addCobonUseCase(
        CobonParams(checkoutId: checkoutId, cobon: cobon, user: user));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future _resetBloc(Emitter<CartState> emit, Checkout? checkout) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(CartState.initial(checkout));
  }

  Future<Order> placeOrder(
      User user, String methodId, List<Map<String, String>> metadata) async {
    final either = await _placeOrderUseCase(
        PlaceOrderParams(user: user, methodId: methodId, metadata: metadata));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Checkout> addToCart(User user, String variantId, int quantity) async {
    final either = await _addToCart(AddToCartParams(user, variantId, quantity));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Checkout> updateAddress(
      User user, Address address, String checkoutId) async {
    final either =
        await _addressUseCase(UpdateAddressParams(user, address, checkoutId));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Checkout> removeFromCart(
      User user, List<String> linesIds, String checkoutId) async {
    final either =
        await _removeFromCart(RemoveFromCartParams(user, linesIds, checkoutId));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<Checkout> updateQuantity(
      User user, String lineId, String checkoutId, int quantity) async {
    final either = await _updateProductToCart(
        UpdateProductCartParams(user, lineId, checkoutId, quantity));
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
