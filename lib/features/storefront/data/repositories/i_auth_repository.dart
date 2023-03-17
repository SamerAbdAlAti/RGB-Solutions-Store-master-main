import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/local_auth_datasource.dart';
import '../datasource/remote_auth_datasource.dart';
import '../models/user_model.dart';

@LazySingleton(as: AuthRepository)
class IAuthRepository implements AuthRepository {
  final AuthLocalDatasource localDatasource;
  final AuthRemoteDatasource remoteDatasource;

  IAuthRepository(this.localDatasource, this.remoteDatasource);

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> tokenMap =
          await remoteDatasource.getToken(email: email, password: password);
      UserModel remoteUser = await remoteDatasource.getUserData(
          token: tokenMap['token'],
          refreshToken: tokenMap['refreshToken'],
          email: email);
      await localDatasource.saveUserData(remoteUser.toJson());
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return Right(await localDatasource.deleteUserData());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      UserModel registeredUser = await remoteDatasource.createUser(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);
      await localDatasource.saveUserData(registeredUser.toJson());
      return Right(registeredUser);
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> checkIfUserExist(
      {required String email, required String password}) async {
    try {
      final answer = await remoteDatasource.checkIfUserExist(
          email: email, password: password);
      return Right(answer);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User?>> localUser() async {
    try {
      final result = await localDatasource.getStoredUser();
      return Right(result);
    } on StorageNotFoundException {
      return Left(StorageNotFoundFailure());
    } on CacheException {
      return Left(CacheFailure());
    } on Exception {
      return Left(StorageNotFoundFailure());
    }
  }

  @override
  Future<Either<Failure, User>> onlineUser(
      {required String refreshToken}) async {
    try {
      final result =
          await remoteDatasource.refreshToken(refreshToken: refreshToken);
      await localDatasource.saveUserData(result.toJson());
      return Right(result);
    } on InformationException catch (error) {
      return Left(InformationFailure(error.message));
    } on ServerException {
      return Left(ServerFailure());
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
