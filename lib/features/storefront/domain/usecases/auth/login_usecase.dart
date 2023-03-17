// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';

import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/auth_repository.dart';

@lazySingleton
class LoginUseCase implements UseCase<User, EmailPassParams> {
  AuthRepository repository;
  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>?> call(EmailPassParams params) async {
    return await repository.login(
        email: params.email, password: params.password);
  }
}

class EmailPassParams extends Equatable {
  String email;
  String password;
  EmailPassParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
