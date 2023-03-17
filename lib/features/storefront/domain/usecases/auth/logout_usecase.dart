// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/auth_repository.dart';

@lazySingleton
class LogoutUseCase implements UseCase<void, NoParams> {
  AuthRepository repository;
  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, void>?> call(NoParams params) async {
    return await repository.logout();
  }
}
