import 'package:injectable/injectable.dart';
import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/user.dart';
import '../../repositories/auth_repository.dart';

@lazySingleton
class LocalAccountUseCase implements UseCase<User?, NoParams> {
  final AuthRepository repository;

  LocalAccountUseCase(this.repository);

  @override
  Future<Either<Failure, User?>?> call(NoParams params) async {
    return await repository.localUser();
  }
}
