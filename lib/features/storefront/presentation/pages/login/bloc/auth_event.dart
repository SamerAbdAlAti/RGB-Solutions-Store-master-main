part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(
      {required String phoneNumber, required String password}) = _Login;
      const factory AuthEvent.loginWithEmail(
      {required String email, required String password}) = _LoginWithEmail;
  const factory AuthEvent.register(
      {required String phoneNumber,
      required String password,
      required String firstName,
      required String lastName}) = _Register;

  const factory AuthEvent.storedAccount() = _StoredAccount;
}
