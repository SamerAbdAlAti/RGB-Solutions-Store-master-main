// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password) login,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(String phoneNumber, String password,
            String firstName, String lastName)
        register,
    required TResult Function() storedAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? login,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult? Function()? storedAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? login,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult Function()? storedAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_Register value) register,
    required TResult Function(_StoredAccount value) storedAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_Register value)? register,
    TResult? Function(_StoredAccount value)? storedAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_Register value)? register,
    TResult Function(_StoredAccount value)? storedAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber, String password});
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_Login>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? password = null,
  }) {
    return _then(_$_Login(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Login implements _Login {
  const _$_Login({required this.phoneNumber, required this.password});

  @override
  final String phoneNumber;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.login(phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Login &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      __$$_LoginCopyWithImpl<_$_Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password) login,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(String phoneNumber, String password,
            String firstName, String lastName)
        register,
    required TResult Function() storedAccount,
  }) {
    return login(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? login,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult? Function()? storedAccount,
  }) {
    return login?.call(phoneNumber, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? login,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult Function()? storedAccount,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(phoneNumber, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_Register value) register,
    required TResult Function(_StoredAccount value) storedAccount,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_Register value)? register,
    TResult? Function(_StoredAccount value)? storedAccount,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_Register value)? register,
    TResult Function(_StoredAccount value)? storedAccount,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login(
      {required final String phoneNumber,
      required final String password}) = _$_Login;

  String get phoneNumber;
  String get password;
  @JsonKey(ignore: true)
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoginWithEmailCopyWith<$Res> {
  factory _$$_LoginWithEmailCopyWith(
          _$_LoginWithEmail value, $Res Function(_$_LoginWithEmail) then) =
      __$$_LoginWithEmailCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LoginWithEmailCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_LoginWithEmail>
    implements _$$_LoginWithEmailCopyWith<$Res> {
  __$$_LoginWithEmailCopyWithImpl(
      _$_LoginWithEmail _value, $Res Function(_$_LoginWithEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginWithEmail(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginWithEmail implements _LoginWithEmail {
  const _$_LoginWithEmail({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.loginWithEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginWithEmail &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginWithEmailCopyWith<_$_LoginWithEmail> get copyWith =>
      __$$_LoginWithEmailCopyWithImpl<_$_LoginWithEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password) login,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(String phoneNumber, String password,
            String firstName, String lastName)
        register,
    required TResult Function() storedAccount,
  }) {
    return loginWithEmail(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? login,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult? Function()? storedAccount,
  }) {
    return loginWithEmail?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? login,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult Function()? storedAccount,
    required TResult orElse(),
  }) {
    if (loginWithEmail != null) {
      return loginWithEmail(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_Register value) register,
    required TResult Function(_StoredAccount value) storedAccount,
  }) {
    return loginWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_Register value)? register,
    TResult? Function(_StoredAccount value)? storedAccount,
  }) {
    return loginWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_Register value)? register,
    TResult Function(_StoredAccount value)? storedAccount,
    required TResult orElse(),
  }) {
    if (loginWithEmail != null) {
      return loginWithEmail(this);
    }
    return orElse();
  }
}

abstract class _LoginWithEmail implements AuthEvent {
  const factory _LoginWithEmail(
      {required final String email,
      required final String password}) = _$_LoginWithEmail;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$_LoginWithEmailCopyWith<_$_LoginWithEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegisterCopyWith<$Res> {
  factory _$$_RegisterCopyWith(
          _$_Register value, $Res Function(_$_Register) then) =
      __$$_RegisterCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String phoneNumber, String password, String firstName, String lastName});
}

/// @nodoc
class __$$_RegisterCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_Register>
    implements _$$_RegisterCopyWith<$Res> {
  __$$_RegisterCopyWithImpl(
      _$_Register _value, $Res Function(_$_Register) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? password = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_$_Register(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Register implements _Register {
  const _$_Register(
      {required this.phoneNumber,
      required this.password,
      required this.firstName,
      required this.lastName});

  @override
  final String phoneNumber;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String lastName;

  @override
  String toString() {
    return 'AuthEvent.register(phoneNumber: $phoneNumber, password: $password, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Register &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, phoneNumber, password, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      __$$_RegisterCopyWithImpl<_$_Register>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password) login,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(String phoneNumber, String password,
            String firstName, String lastName)
        register,
    required TResult Function() storedAccount,
  }) {
    return register(phoneNumber, password, firstName, lastName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? login,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult? Function()? storedAccount,
  }) {
    return register?.call(phoneNumber, password, firstName, lastName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? login,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult Function()? storedAccount,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(phoneNumber, password, firstName, lastName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_Register value) register,
    required TResult Function(_StoredAccount value) storedAccount,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_Register value)? register,
    TResult? Function(_StoredAccount value)? storedAccount,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_Register value)? register,
    TResult Function(_StoredAccount value)? storedAccount,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements AuthEvent {
  const factory _Register(
      {required final String phoneNumber,
      required final String password,
      required final String firstName,
      required final String lastName}) = _$_Register;

  String get phoneNumber;
  String get password;
  String get firstName;
  String get lastName;
  @JsonKey(ignore: true)
  _$$_RegisterCopyWith<_$_Register> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StoredAccountCopyWith<$Res> {
  factory _$$_StoredAccountCopyWith(
          _$_StoredAccount value, $Res Function(_$_StoredAccount) then) =
      __$$_StoredAccountCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StoredAccountCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_StoredAccount>
    implements _$$_StoredAccountCopyWith<$Res> {
  __$$_StoredAccountCopyWithImpl(
      _$_StoredAccount _value, $Res Function(_$_StoredAccount) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_StoredAccount implements _StoredAccount {
  const _$_StoredAccount();

  @override
  String toString() {
    return 'AuthEvent.storedAccount()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_StoredAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phoneNumber, String password) login,
    required TResult Function(String email, String password) loginWithEmail,
    required TResult Function(String phoneNumber, String password,
            String firstName, String lastName)
        register,
    required TResult Function() storedAccount,
  }) {
    return storedAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phoneNumber, String password)? login,
    TResult? Function(String email, String password)? loginWithEmail,
    TResult? Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult? Function()? storedAccount,
  }) {
    return storedAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phoneNumber, String password)? login,
    TResult Function(String email, String password)? loginWithEmail,
    TResult Function(String phoneNumber, String password, String firstName,
            String lastName)?
        register,
    TResult Function()? storedAccount,
    required TResult orElse(),
  }) {
    if (storedAccount != null) {
      return storedAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginWithEmail value) loginWithEmail,
    required TResult Function(_Register value) register,
    required TResult Function(_StoredAccount value) storedAccount,
  }) {
    return storedAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginWithEmail value)? loginWithEmail,
    TResult? Function(_Register value)? register,
    TResult? Function(_StoredAccount value)? storedAccount,
  }) {
    return storedAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginWithEmail value)? loginWithEmail,
    TResult Function(_Register value)? register,
    TResult Function(_StoredAccount value)? storedAccount,
    required TResult orElse(),
  }) {
    if (storedAccount != null) {
      return storedAccount(this);
    }
    return orElse();
  }
}

abstract class _StoredAccount implements AuthEvent {
  const factory _StoredAccount() = _$_StoredAccount;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(User user)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<$Res> {
  factory _$$_EmptyCopyWith(_$_Empty value, $Res Function(_$_Empty) then) =
      __$$_EmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Empty>
    implements _$$_EmptyCopyWith<$Res> {
  __$$_EmptyCopyWithImpl(_$_Empty _value, $Res Function(_$_Empty) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Empty implements _Empty {
  const _$_Empty();

  @override
  String toString() {
    return 'AuthState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(String message) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(User user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements AuthState {
  const factory _Empty() = _$_Empty;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(User user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_Loaded(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.loaded(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(User user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthState {
  const factory _Loaded(final User user) = _$_Loaded;

  User get user;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Error(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(User user) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(User user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(User user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty value) empty,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty value)? empty,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
