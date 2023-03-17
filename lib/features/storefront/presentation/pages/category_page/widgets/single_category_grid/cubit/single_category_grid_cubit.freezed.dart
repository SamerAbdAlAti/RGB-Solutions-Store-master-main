// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_category_grid_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleCategoryGridState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Product> products, Category category)
        initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, Category category) loaded,
    required TResult Function(List<Product> products, Category category)
        fetching,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Product> products, Category category)? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, Category category)? loaded,
    TResult? Function(List<Product> products, Category category)? fetching,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Product> products, Category category)? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, Category category)? loaded,
    TResult Function(List<Product> products, Category category)? fetching,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Fetching value)? fetching,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleCategoryGridStateCopyWith<$Res> {
  factory $SingleCategoryGridStateCopyWith(SingleCategoryGridState value,
          $Res Function(SingleCategoryGridState) then) =
      _$SingleCategoryGridStateCopyWithImpl<$Res, SingleCategoryGridState>;
}

/// @nodoc
class _$SingleCategoryGridStateCopyWithImpl<$Res,
        $Val extends SingleCategoryGridState>
    implements $SingleCategoryGridStateCopyWith<$Res> {
  _$SingleCategoryGridStateCopyWithImpl(this._value, this._then);

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
  $Res call({List<Product> products, Category category});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SingleCategoryGridStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? category = null,
  }) {
    return _then(_$_Initial(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(final List<Product> products, this.category)
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final Category category;

  @override
  String toString() {
    return 'SingleCategoryGridState.initial(products: $products, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_products), category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Product> products, Category category)
        initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, Category category) loaded,
    required TResult Function(List<Product> products, Category category)
        fetching,
    required TResult Function(dynamic error) error,
  }) {
    return initial(products, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Product> products, Category category)? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, Category category)? loaded,
    TResult? Function(List<Product> products, Category category)? fetching,
    TResult? Function(dynamic error)? error,
  }) {
    return initial?.call(products, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Product> products, Category category)? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, Category category)? loaded,
    TResult Function(List<Product> products, Category category)? fetching,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(products, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Fetching value)? fetching,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SingleCategoryGridState {
  const factory _Initial(
      final List<Product> products, final Category category) = _$_Initial;

  List<Product> get products;
  Category get category;
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
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
    extends _$SingleCategoryGridStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'SingleCategoryGridState.loading()';
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
    required TResult Function(List<Product> products, Category category)
        initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, Category category) loaded,
    required TResult Function(List<Product> products, Category category)
        fetching,
    required TResult Function(dynamic error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Product> products, Category category)? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, Category category)? loaded,
    TResult? Function(List<Product> products, Category category)? fetching,
    TResult? Function(dynamic error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Product> products, Category category)? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, Category category)? loaded,
    TResult Function(List<Product> products, Category category)? fetching,
    TResult Function(dynamic error)? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Fetching value)? fetching,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SingleCategoryGridState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products, Category category});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$SingleCategoryGridStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? category = null,
  }) {
    return _then(_$_Loaded(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(final List<Product> products, this.category)
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final Category category;

  @override
  String toString() {
    return 'SingleCategoryGridState.loaded(products: $products, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_products), category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Product> products, Category category)
        initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, Category category) loaded,
    required TResult Function(List<Product> products, Category category)
        fetching,
    required TResult Function(dynamic error) error,
  }) {
    return loaded(products, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Product> products, Category category)? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, Category category)? loaded,
    TResult? Function(List<Product> products, Category category)? fetching,
    TResult? Function(dynamic error)? error,
  }) {
    return loaded?.call(products, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Product> products, Category category)? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, Category category)? loaded,
    TResult Function(List<Product> products, Category category)? fetching,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(products, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Fetching value)? fetching,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SingleCategoryGridState {
  const factory _Loaded(final List<Product> products, final Category category) =
      _$_Loaded;

  List<Product> get products;
  Category get category;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchingCopyWith<$Res> {
  factory _$$_FetchingCopyWith(
          _$_Fetching value, $Res Function(_$_Fetching) then) =
      __$$_FetchingCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> products, Category category});
}

/// @nodoc
class __$$_FetchingCopyWithImpl<$Res>
    extends _$SingleCategoryGridStateCopyWithImpl<$Res, _$_Fetching>
    implements _$$_FetchingCopyWith<$Res> {
  __$$_FetchingCopyWithImpl(
      _$_Fetching _value, $Res Function(_$_Fetching) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? category = null,
  }) {
    return _then(_$_Fetching(
      null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$_Fetching implements _Fetching {
  const _$_Fetching(final List<Product> products, this.category)
      : _products = products;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final Category category;

  @override
  String toString() {
    return 'SingleCategoryGridState.fetching(products: $products, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetching &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_products), category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchingCopyWith<_$_Fetching> get copyWith =>
      __$$_FetchingCopyWithImpl<_$_Fetching>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Product> products, Category category)
        initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, Category category) loaded,
    required TResult Function(List<Product> products, Category category)
        fetching,
    required TResult Function(dynamic error) error,
  }) {
    return fetching(products, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Product> products, Category category)? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, Category category)? loaded,
    TResult? Function(List<Product> products, Category category)? fetching,
    TResult? Function(dynamic error)? error,
  }) {
    return fetching?.call(products, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Product> products, Category category)? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, Category category)? loaded,
    TResult Function(List<Product> products, Category category)? fetching,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(products, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_Error value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Fetching value)? fetching,
    TResult? Function(_Error value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class _Fetching implements SingleCategoryGridState {
  const factory _Fetching(
      final List<Product> products, final Category category) = _$_Fetching;

  List<Product> get products;
  Category get category;
  @JsonKey(ignore: true)
  _$$_FetchingCopyWith<_$_Fetching> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$SingleCategoryGridStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Error(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final dynamic error;

  @override
  String toString() {
    return 'SingleCategoryGridState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Product> products, Category category)
        initial,
    required TResult Function() loading,
    required TResult Function(List<Product> products, Category category) loaded,
    required TResult Function(List<Product> products, Category category)
        fetching,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Product> products, Category category)? initial,
    TResult? Function()? loading,
    TResult? Function(List<Product> products, Category category)? loaded,
    TResult? Function(List<Product> products, Category category)? fetching,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Product> products, Category category)? initial,
    TResult Function()? loading,
    TResult Function(List<Product> products, Category category)? loaded,
    TResult Function(List<Product> products, Category category)? fetching,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Fetching value) fetching,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Fetching value)? fetching,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Fetching value)? fetching,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SingleCategoryGridState {
  const factory _Error(final dynamic error) = _$_Error;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
