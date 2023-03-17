// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BannerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        initial,
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        saved,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saved value)? saved,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @useResult
  $Res call({Tuple3<List<Poster>, List<Poster>, List<Poster>> posters});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posters = null,
  }) {
    return _then(_$_Initial(
      null == posters
          ? _value.posters
          : posters // ignore: cast_nullable_to_non_nullable
              as Tuple3<List<Poster>, List<Poster>, List<Poster>>,
    ));
  }
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial(this.posters);

  @override
  final Tuple3<List<Poster>, List<Poster>, List<Poster>> posters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerState.initial(posters: $posters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BannerState.initial'))
      ..add(DiagnosticsProperty('posters', posters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.posters, posters) || other.posters == posters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, posters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        initial,
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        saved,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return initial(posters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return initial?.call(posters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(posters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saved value)? saved,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BannerState {
  const factory _Initial(
          final Tuple3<List<Poster>, List<Poster>, List<Poster>> posters) =
      _$_Initial;

  Tuple3<List<Poster>, List<Poster>, List<Poster>> get posters;
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavedCopyWith<$Res> {
  factory _$$_SavedCopyWith(_$_Saved value, $Res Function(_$_Saved) then) =
      __$$_SavedCopyWithImpl<$Res>;
  @useResult
  $Res call({Tuple3<List<Poster>, List<Poster>, List<Poster>> posters});
}

/// @nodoc
class __$$_SavedCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$_Saved>
    implements _$$_SavedCopyWith<$Res> {
  __$$_SavedCopyWithImpl(_$_Saved _value, $Res Function(_$_Saved) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posters = null,
  }) {
    return _then(_$_Saved(
      null == posters
          ? _value.posters
          : posters // ignore: cast_nullable_to_non_nullable
              as Tuple3<List<Poster>, List<Poster>, List<Poster>>,
    ));
  }
}

/// @nodoc

class _$_Saved with DiagnosticableTreeMixin implements _Saved {
  const _$_Saved(this.posters);

  @override
  final Tuple3<List<Poster>, List<Poster>, List<Poster>> posters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerState.saved(posters: $posters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BannerState.saved'))
      ..add(DiagnosticsProperty('posters', posters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Saved &&
            (identical(other.posters, posters) || other.posters == posters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, posters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedCopyWith<_$_Saved> get copyWith =>
      __$$_SavedCopyWithImpl<_$_Saved>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        initial,
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        saved,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return saved(posters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return saved?.call(posters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult Function()? loading,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(posters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saved value)? saved,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements BannerState {
  const factory _Saved(
          final Tuple3<List<Poster>, List<Poster>, List<Poster>> posters) =
      _$_Saved;

  Tuple3<List<Poster>, List<Poster>, List<Poster>> get posters;
  @JsonKey(ignore: true)
  _$$_SavedCopyWith<_$_Saved> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  const _$_Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'BannerState.loading'));
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
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        initial,
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        saved,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult Function()? loading,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saved value)? saved,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BannerState {
  const factory _Loading() = _$_Loading;
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
    extends _$BannerStateCopyWithImpl<$Res, _$_Error>
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

class _$_Error with DiagnosticableTreeMixin implements _Error {
  const _$_Error(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannerState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BannerState.error'))
      ..add(DiagnosticsProperty('message', message));
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
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        initial,
    required TResult Function(
            Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)
        saved,
    required TResult Function() loading,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult? Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        initial,
    TResult Function(Tuple3<List<Poster>, List<Poster>, List<Poster>> posters)?
        saved,
    TResult Function()? loading,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saved value) saved,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saved value)? saved,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saved value)? saved,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BannerState {
  const factory _Error(final String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
