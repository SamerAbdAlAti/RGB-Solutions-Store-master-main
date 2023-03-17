// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/checkout.dart';
import '../../entities/user.dart';
import '../../repositories/checkout_repository.dart';

@lazySingleton
class RemoveCobonUseCase implements UseCase<Checkout, CobonParams> {
  final CheckoutRepository repository;

  RemoveCobonUseCase(this.repository);
  @override
  Future<Either<Failure, Checkout>?> call(CobonParams params) async =>
      await repository.removeCobon(
          user: params.user,
          checkoutId: params.checkoutId,
          cobon: params.cobon);
}

class CobonParams {
  String checkoutId;
  String cobon;
  User user;
  CobonParams({
    required this.checkoutId,
    required this.cobon,
    required this.user,
  });
}
