// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/checkout/remove_cobon_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/checkout.dart';
import '../../repositories/checkout_repository.dart';

@lazySingleton
class AddCobonUseCase implements UseCase<Checkout, CobonParams> {
  final CheckoutRepository repository;

  AddCobonUseCase(this.repository);
  @override
  Future<Either<Failure, Checkout>?> call(CobonParams params) async =>
      await repository.addCobon(
          user: params.user,
          checkoutId: params.checkoutId,
          cobon: params.cobon);
}
