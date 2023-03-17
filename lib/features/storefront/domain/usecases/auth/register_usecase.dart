// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/auth_repository.dart';

@lazySingleton
class RegisterUseCase implements UseCase<User, RegsiterParams> {
  AuthRepository repository;
  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, User>?> call(RegsiterParams params) async {
    return await repository.register(
        email: params.email,
        password: params.password,
        firstName: params.firstName,
        lastName: params.lastName);
  }
}

class RegsiterParams extends Equatable {
  String email;
  String password;
  String firstName;
  String lastName;
  RegsiterParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object> get props => [email, password, firstName, lastName];
}
