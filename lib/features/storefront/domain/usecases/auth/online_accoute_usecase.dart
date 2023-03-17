// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

@lazySingleton
class OnlineAccountUseCase implements UseCase<User, OnlineAccountParams> {
  final AuthRepository repository;

  OnlineAccountUseCase(this.repository);

  @override
  Future<Either<Failure, User>?> call(OnlineAccountParams params) async {
    return await repository.onlineUser(refreshToken: params.refreshToken);
  }
}

class OnlineAccountParams {
  String refreshToken;
  OnlineAccountParams({
    required this.refreshToken,
  });
}
