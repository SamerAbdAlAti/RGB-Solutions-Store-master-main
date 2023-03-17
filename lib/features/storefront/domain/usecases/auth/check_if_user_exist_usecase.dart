import 'package:injectable/injectable.dart';
import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../repositories/auth_repository.dart';
import 'login_usecase.dart';

@lazySingleton
class CheckIfUserExistUseCase implements UseCase<bool, EmailPassParams> {
  final AuthRepository repository;

  CheckIfUserExistUseCase(this.repository);
  @override
  Future<Either<Failure, bool>?> call(EmailPassParams params) async {
    return await repository.checkIfUserExist(
        email: params.email, password: params.password);
  }
}
