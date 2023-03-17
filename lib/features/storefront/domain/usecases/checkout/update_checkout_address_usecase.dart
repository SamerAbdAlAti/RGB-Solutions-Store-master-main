import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/checkout_repository.dart';

@lazySingleton
class UpdateCheckoutAddressUseCase
    implements UseCase<Checkout, UpdateAddressParams> {
  final CheckoutRepository repository;

  UpdateCheckoutAddressUseCase(this.repository);
  @override
  Future<Either<Failure, Checkout>?> call(UpdateAddressParams params) async =>
      await repository.addAddressToCart(
          address: params.address,
          checkoutId: params.checkoutId,
          user: params.user);
}

class UpdateAddressParams extends Equatable {
  final User user;
  final Address address;
  final String checkoutId;
  const UpdateAddressParams(this.user, this.address, this.checkoutId);

  @override
  List<Object?> get props => throw UnimplementedError();
}
