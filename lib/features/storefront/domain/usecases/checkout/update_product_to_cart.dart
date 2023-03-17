import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/checkout_repository.dart';

@lazySingleton
class UpdateProductToCartUsecase
    implements UseCase<Checkout, UpdateProductCartParams> {
  final CheckoutRepository repository;

  UpdateProductToCartUsecase(this.repository);
  @override
  Future<Either<Failure, Checkout>?> call(
          UpdateProductCartParams params) async =>
      await repository.updateProductToCart(
          user: params.user,
          lineId: params.lineId,
          quantity: params.quantity,
          checkoutId: params.checkoutId);
}

class UpdateProductCartParams extends Equatable {
  final User user;
  final int quantity;
  final String lineId;
  final String checkoutId;

  const UpdateProductCartParams(
      this.user, this.lineId, this.checkoutId, this.quantity);

  @override
  List<Object?> get props => throw UnimplementedError();
}
