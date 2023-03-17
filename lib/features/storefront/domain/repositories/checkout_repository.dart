import 'package:dartz/dartz.dart' hide Order;
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, Checkout>> addToCart(
      {required User user, required String variantId, required int quantity});
  Future<Either<Failure, Checkout>> removefromCart(
      {required User user,
      required List<String> linesIds,
      required String checkoutId});
  Future<Either<Failure, Checkout>> updateProductToCart(
      {required User user,
      required String checkoutId,
      required String lineId,
      required int quantity});
  Future<Either<Failure, Checkout>> addAddressToCart(
      {required Address address,
      required String checkoutId,
      required User user});
  Future<Either<Failure, Checkout>> addCobon(
      {required String checkoutId, required String cobon, required User user});
  Future<Either<Failure, Checkout>> removeCobon(
      {required String checkoutId, required String cobon, required User user});
}
