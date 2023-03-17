import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/auth/online_accoute_usecase.dart';
import 'package:saleor_app_flutter/shared_preferenced.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/error/exceptions.dart';
import '../../../../../../core/error/failures.dart';
import '../../../../../../core/usecase/usecase.dart';
import '../../../../../../core/utl/phone_converter.dart';
import '../../../../domain/entities/user.dart';
import '../../../../domain/usecases/auth/check_if_user_exist_usecase.dart';
import '../../../../domain/usecases/auth/local_account_usecase.dart';
import '../../../../domain/usecases/auth/login_usecase.dart';
import '../../../../domain/usecases/auth/logout_usecase.dart';
import '../../../../domain/usecases/auth/register_usecase.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;
  final LocalAccountUseCase _localAccountUseCase;
  final OnlineAccountUseCase _onlineAccountUseCase;
  final PhoneConverter _phoneConverter;
  final CheckIfUserExistUseCase _userExist;
  SharedPreferences? prefs;

  // for shared preference
  void initState() {
    // super.initState();
    initPrefs();
  }

  // for shared preference
  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  AuthBloc(
      this._loginUseCase,
      this._registerUseCase,
      this._logoutUseCase,
      this._localAccountUseCase,
      this._phoneConverter,
      this._userExist,
      this._onlineAccountUseCase)
      : super(const _Empty()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        login: (phoneNumber, password) async {
          try {
            emit(const AuthState.loading());
            final user =
                await login(phoneNumber: phoneNumber, password: password);
            emit(AuthState.loaded(user));
          } on InformationException catch (error) {
            emit(AuthState.error(error.message));
          }
        },
        loginWithEmail: (email, password) async {
          try {
            emit(const AuthState.loading());
            final user = await loginWithEmail(email: email, password: password);
            emit(AuthState.loaded(user));
          } on InformationException catch (error) {
            emit(AuthState.error(error.message));
          }
        },
        register: (phoneNumber, password, firstName, lastName) async {
          try {
            emit(const AuthState.loading());
            final user = await accountRegister(
                phoneNumber: phoneNumber,
                password: password,
                firstName: firstName,
                lastName: lastName);
            emit(AuthState.loaded(user));
          } on InformationException catch (error) {
            emit(AuthState.error(error.message));
          }
        },
        storedAccount: () async {
          try {
            emit(const AuthState.loading());
            final user = await localAccount();
            emit(AuthState.loaded(user!));
          } on InformationException catch (error) {
            emit(AuthState.error(error.message));
          } on StorageNotFoundException {
            emit(const AuthState.error("لا يوجد مستخدم محفوظ"));
          }
        },
      );
    });
  }

  // if the user log in
  // Future<bool> isLoggedIn() async {
  //   try {
  //     await localAccount();
  //     return true;
  //   } on Exception {
  //     return false;
  //   }
  // }

  Future<User> accountRegister(
      {required String phoneNumber,
      required String password,
      required String firstName,
      required String lastName}) async {
    final either = await _registerUseCase(RegsiterParams(
        email: _phoneConverter.toEmail(phoneNumber),
        password: password,
        firstName: firstName,
        lastName: lastName));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<String?> ifUserExist(
      {required String phoneNumber, required String password}) async {
    final either = await _userExist(EmailPassParams(
        email: _phoneConverter.toEmail(phoneNumber), password: password));
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) {
      if (!r) {
        return "يوجد مستخدم بهذا الرقم";
      } else {
        return null;
      }
    });
  }

  Future<User> login(
      {required String phoneNumber, required String password}) async {
    final either = await _loginUseCase(EmailPassParams(
        email: _phoneConverter.toEmail(phoneNumber), password: password));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<User> loginWithEmail(
      {required String email, required String password}) async {
    final either =
        await _loginUseCase(EmailPassParams(email: email, password: password));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<User?> localAccount() async {
    final either = await _localAccountUseCase(NoParams());
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<User> onlineAccount() async {
    final localuser = await localAccount();
    final either = await _onlineAccountUseCase(
        OnlineAccountParams(refreshToken: localuser!.refreshToken));
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<void> logout({required User user}) async {
    final either = await _logoutUseCase(NoParams());
    return await either!
        .fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Exception _getFailureAndThrowException(Failure l) {
    switch (l.runtimeType) {
      case ServerFailure:
        return ServerException();
      case CacheFailure:
        return CacheException();
      case InformationFailure:
        final fail = l as InformationFailure;
        return InformationException(message: fail.message);
      case StorageNotFoundFailure:
        return StorageNotFoundException();
      default:
        return UnexpectedException();
    }
  }


}

