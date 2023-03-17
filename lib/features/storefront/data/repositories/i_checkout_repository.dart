import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart' hide Order;
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/local_auth_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_auth_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_checkout_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/user_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/checkout_repository.dart';

@LazySingleton(as: CheckoutRepository)
class ICheckoutRepository implements CheckoutRepository {
  final RemoteCheckoutDatasource checkoutDatasource;
  final AuthRemoteDatasource authRemoteDatasource;
  final AuthLocalDatasource authLocalDatasource;

  ICheckoutRepository(this.checkoutDatasource, this.authRemoteDatasource,
      this.authLocalDatasource);

  @override
  Future<Either<Failure, Checkout>> addToCart(
      {required User user,
      required String variantId,
      required int quantity}) async {
    try {
      bool isTokenValid =
          await authRemoteDatasource.isTokenValid(token: user.token);
      if (isTokenValid) {
        if (user.checkouts.isEmpty) {
          final result = await checkoutDatasource
              .checkoutCreate(
                  quantity: quantity, variantId: variantId, token: user.token)
              .then((value) => value);
          user.checkouts = [result];
          await authLocalDatasource.saveUserData((user as UserModel).toJson());
          return Right(result);
        } else {
          final result = await checkoutDatasource.addCheckoutLine(
              checkoutId: user.checkouts.first.id,
              quantity: quantity,
              variantId: variantId,
              token: user.token);
          user.checkouts.first = result;
          await authLocalDatasource.saveUserData((user as UserModel).toJson());
          return Right(result);
        }
      } else {
        UserModel newUser = await authRemoteDatasource.refreshToken(
            refreshToken: user.refreshToken);
        if (newUser.checkouts.isEmpty) {
          final result = await checkoutDatasource
              .checkoutCreate(
                  quantity: quantity,
                  variantId: variantId,
                  token: newUser.token)
              .then((value) => value);
          newUser.checkouts = [result];
          await authLocalDatasource.saveUserData(newUser.toJson());
          return Right(result);
        } else {
          final result = await checkoutDatasource
              .addCheckoutLine(
                  checkoutId: newUser.checkouts.first.id,
                  quantity: quantity,
                  variantId: variantId,
                  token: newUser.token)
              .then((value) => value);
          newUser.checkouts.first = result;
          await authLocalDatasource.saveUserData((newUser).toJson());
          return Right(result);
        }
      }
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    }
  }

  @override
  Future<Either<Failure, Checkout>> removefromCart(
      {required User user,
      required List<String> linesIds,
      required String checkoutId}) async {
    try {
      bool isTokenValid =
          await authRemoteDatasource.isTokenValid(token: user.token);
      if (isTokenValid) {
        final result = await checkoutDatasource
            .deleteCheckoutLine(
                checkoutId: checkoutId, linesIds: linesIds, token: user.token)
            .then((value) => value);
        await _setCheckoutAndSaveUser((user as UserModel), result, checkoutId);
        return Right(result);
      } else {
        UserModel newUser = await authRemoteDatasource.refreshToken(
            refreshToken: user.refreshToken);
        final result = await checkoutDatasource.deleteCheckoutLine(
            checkoutId: checkoutId, linesIds: linesIds, token: newUser.token);
        await _setCheckoutAndSaveUser(newUser, result, checkoutId);
        return Right(result);
      }
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    }
  }

  @override
  Future<Either<Failure, Checkout>> updateProductToCart(
      {required User user,
      required String checkoutId,
      required String lineId,
      required int quantity}) async {
    try {
      bool isTokenValid =
          await authRemoteDatasource.isTokenValid(token: user.token);

      if (isTokenValid) {
        final result = await checkoutDatasource
            .updateCheckoutLine(
                checkoutId: checkoutId,
                lineId: lineId,
                quantity: quantity,
                token: user.token)
            .then((value) {
          return value;
        });
        await _setCheckoutAndSaveUser((user as UserModel), result, checkoutId);
        return Right(result);
      } else {
        UserModel newUser = await authRemoteDatasource.refreshToken(
            refreshToken: user.refreshToken);
        final result = await checkoutDatasource.updateCheckoutLine(
            checkoutId: checkoutId,
            lineId: lineId,
            quantity: quantity,
            token: newUser.token);
        await _setCheckoutAndSaveUser(newUser, result, checkoutId);
        return Right(result);
      }
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    }
  }

  Future<void> _setCheckoutAndSaveUser(
      UserModel user, Checkout checkout, String checkoutId) async {
    try {
      user.checkouts[user.checkouts
          .indexWhere((element) => element.id == checkoutId)] = checkout;
      await authLocalDatasource.saveUserData(user.toJson());
    } on Exception {
      throw InformationException(message: 'خطأ في قاعدة التخزين المحلية.');
    }
  }

  @override
  Future<Either<Failure, Checkout>> addAddressToCart(
      {required Address address,
      required String checkoutId,
      required User user}) async {
    try {
      bool isTokenValid =
          await authRemoteDatasource.isTokenValid(token: user.token);

      if (isTokenValid) {
        final result = await checkoutDatasource
            .updateShippingAddress(
                checkoutId: checkoutId,
                address: address as AddressModel,
                token: user.token)
            .then((value) {
          return value;
        });
        await _setCheckoutAndSaveUser((user as UserModel), result, checkoutId);
        return Right(result);
      } else {
        UserModel newUser = await authRemoteDatasource.refreshToken(
            refreshToken: user.refreshToken);
        final result = await checkoutDatasource.updateShippingAddress(
            checkoutId: checkoutId,
            address: address as AddressModel,
            token: newUser.token);
        await _setCheckoutAndSaveUser(newUser, result, checkoutId);
        return Right(result);
      }
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    }
  }

  @override
  Future<Either<Failure, Checkout>> addCobon(
      {required String checkoutId,
      required String cobon,
      required User user}) async {
    try {
      bool isTokenValid =
          await authRemoteDatasource.isTokenValid(token: user.token);
      if (isTokenValid) {
        final result = await checkoutDatasource.addCobon(
            checkoutId: checkoutId, cobon: cobon, token: user.token);
        await _setCheckoutAndSaveUser((user as UserModel), result, checkoutId);
        return Right(result);
      } else {
        UserModel newUser = await authRemoteDatasource.refreshToken(
            refreshToken: user.refreshToken);
        final result = await checkoutDatasource.addCobon(
            checkoutId: checkoutId, cobon: cobon, token: newUser.token);
        await _setCheckoutAndSaveUser(newUser, result, checkoutId);
        return Right(result);
      }
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    }
  }

  @override
  Future<Either<Failure, Checkout>> removeCobon(
      {required String checkoutId,
      required String cobon,
      required User user}) async {
    try {
      bool isTokenValid =
          await authRemoteDatasource.isTokenValid(token: user.token);
      if (isTokenValid) {
        final result = await checkoutDatasource.removeCobon(
            checkoutId: checkoutId, cobon: cobon, token: user.token);
        await _setCheckoutAndSaveUser((user as UserModel), result, checkoutId);
        return Right(result);
      } else {
        UserModel newUser = await authRemoteDatasource.refreshToken(
            refreshToken: user.refreshToken);
        final result = await checkoutDatasource.removeCobon(
            checkoutId: checkoutId, cobon: cobon, token: newUser.token);
        await _setCheckoutAndSaveUser(newUser, result, checkoutId);
        return Right(result);
      }
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(InformationFailure('خطأ في قاعدة التخزين المحلية.'));
    } on ServerException {
      return Left(InformationFailure('خطأ في الخادم، يتم العمل على اصلاحه.'));
    }
  }
}
