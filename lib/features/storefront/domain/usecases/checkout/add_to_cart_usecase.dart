import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/checkout_repository.dart';

@lazySingleton
class AddToCartUsecase implements UseCase<Checkout, AddToCartParams> {
  final CheckoutRepository repository;

  AddToCartUsecase(this.repository);
  @override
  Future<Either<Failure, Checkout>?> call(AddToCartParams params) async =>
      await repository.addToCart(
          user: params.user,
          quantity: params.quantity,
          variantId: params.variantId);
}

class AddToCartParams extends Equatable {
  final User user;
  final String variantId;
  final int quantity;

  const AddToCartParams(this.user, this.variantId, this.quantity);

  @override
  List<Object?> get props => throw UnimplementedError();
}
