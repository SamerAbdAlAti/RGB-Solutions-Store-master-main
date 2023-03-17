import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User?>> localUser();
  Future<Either<Failure, User>> onlineUser({required String refreshToken});
  Future<Either<Failure, bool>> checkIfUserExist(
      {required String email, required String password});
  Future<Either<Failure, User>> login(
      {required String email, required String password});
  Future<Either<Failure, User>> register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName});
}
