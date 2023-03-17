import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/checkout_repository.dart';

@lazySingleton
class RemoveFromCartUsecase implements UseCase<Checkout, RemoveFromCartParams> {
  final CheckoutRepository repository;

  RemoveFromCartUsecase(this.repository);
  @override
  Future<Either<Failure, Checkout>?> call(RemoveFromCartParams params) async =>
      await repository.removefromCart(
          user: params.user,
          linesIds: params.linesIds,
          checkoutId: params.checkoutId);
}

class RemoveFromCartParams extends Equatable {
  final User user;
  final List<String> linesIds;
  final String checkoutId;

  const RemoveFromCartParams(this.user, this.linesIds, this.checkoutId);

  @override
  List<Object?> get props => throw UnimplementedError();
}
