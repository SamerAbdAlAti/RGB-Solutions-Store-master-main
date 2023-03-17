// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  @useResult
  $Res call({Future<User> getUser});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUser = null,
  }) {
    return _then(_$_Started(
      null == getUser
          ? _value.getUser
          : getUser // ignore: cast_nullable_to_non_nullable
              as Future<User>,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.getUser);

  @override
  final Future<User> getUser;

  @override
  String toString() {
    return 'CartEvent.started(getUser: $getUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            (identical(other.getUser, getUser) || other.getUser == getUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) {
    return started(getUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) {
    return started?.call(getUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(getUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CartEvent {
  const factory _Started(final Future<User> getUser) = _$_Started;

  Future<User> get getUser;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_addItemCopyWith<$Res> {
  factory _$$_addItemCopyWith(
          _$_addItem value, $Res Function(_$_addItem) then) =
      __$$_addItemCopyWithImpl<$Res>;
  @useResult
  $Res call({Future<User?> getUser, String variantId, int quantity});
}

/// @nodoc
class __$$_addItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_addItem>
    implements _$$_addItemCopyWith<$Res> {
  __$$_addItemCopyWithImpl(_$_addItem _value, $Res Function(_$_addItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUser = null,
    Object? variantId = null,
    Object? quantity = null,
  }) {
    return _then(_$_addItem(
      null == getUser
          ? _value.getUser
          : getUser // ignore: cast_nullable_to_non_nullable
              as Future<User?>,
      null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_addItem implements _addItem {
  const _$_addItem(this.getUser, this.variantId, this.quantity);

  @override
  final Future<User?> getUser;
  @override
  final String variantId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartEvent.addItem(getUser: $getUser, variantId: $variantId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_addItem &&
            (identical(other.getUser, getUser) || other.getUser == getUser) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getUser, variantId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_addItemCopyWith<_$_addItem> get copyWith =>
      __$$_addItemCopyWithImpl<_$_addItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) {
    return addItem(getUser, variantId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) {
    return addItem?.call(getUser, variantId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(getUser, variantId, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) {
    return addItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) {
    return addItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(this);
    }
    return orElse();
  }
}

abstract class _addItem implements CartEvent {
  const factory _addItem(final Future<User?> getUser, final String variantId,
      final int quantity) = _$_addItem;

  Future<User?> get getUser;
  String get variantId;
  int get quantity;
  @JsonKey(ignore: true)
  _$$_addItemCopyWith<_$_addItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteItemCopyWith<$Res> {
  factory _$$_DeleteItemCopyWith(
          _$_DeleteItem value, $Res Function(_$_DeleteItem) then) =
      __$$_DeleteItemCopyWithImpl<$Res>;
  @useResult
  $Res call({Future<User> getUser, List<String> linesIds, String checkoutId});
}

/// @nodoc
class __$$_DeleteItemCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_DeleteItem>
    implements _$$_DeleteItemCopyWith<$Res> {
  __$$_DeleteItemCopyWithImpl(
      _$_DeleteItem _value, $Res Function(_$_DeleteItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUser = null,
    Object? linesIds = null,
    Object? checkoutId = null,
  }) {
    return _then(_$_DeleteItem(
      null == getUser
          ? _value.getUser
          : getUser // ignore: cast_nullable_to_non_nullable
              as Future<User>,
      null == linesIds
          ? _value._linesIds
          : linesIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == checkoutId
          ? _value.checkoutId
          : checkoutId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteItem implements _DeleteItem {
  const _$_DeleteItem(
      this.getUser, final List<String> linesIds, this.checkoutId)
      : _linesIds = linesIds;

  @override
  final Future<User> getUser;
  final List<String> _linesIds;
  @override
  List<String> get linesIds {
    if (_linesIds is EqualUnmodifiableListView) return _linesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_linesIds);
  }

  @override
  final String checkoutId;

  @override
  String toString() {
    return 'CartEvent.deleteItem(getUser: $getUser, linesIds: $linesIds, checkoutId: $checkoutId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteItem &&
            (identical(other.getUser, getUser) || other.getUser == getUser) &&
            const DeepCollectionEquality().equals(other._linesIds, _linesIds) &&
            (identical(other.checkoutId, checkoutId) ||
                other.checkoutId == checkoutId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getUser,
      const DeepCollectionEquality().hash(_linesIds), checkoutId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteItemCopyWith<_$_DeleteItem> get copyWith =>
      __$$_DeleteItemCopyWithImpl<_$_DeleteItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) {
    return deleteItem(getUser, linesIds, checkoutId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) {
    return deleteItem?.call(getUser, linesIds, checkoutId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(getUser, linesIds, checkoutId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) {
    return deleteItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) {
    return deleteItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(this);
    }
    return orElse();
  }
}

abstract class _DeleteItem implements CartEvent {
  const factory _DeleteItem(final Future<User> getUser,
      final List<String> linesIds, final String checkoutId) = _$_DeleteItem;

  Future<User> get getUser;
  List<String> get linesIds;
  String get checkoutId;
  @JsonKey(ignore: true)
  _$$_DeleteItemCopyWith<_$_DeleteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateQuantityCopyWith<$Res> {
  factory _$$_UpdateQuantityCopyWith(
          _$_UpdateQuantity value, $Res Function(_$_UpdateQuantity) then) =
      __$$_UpdateQuantityCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Future<User> getUser, String lineId, String checkoutId, int quantity});
}

/// @nodoc
class __$$_UpdateQuantityCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateQuantity>
    implements _$$_UpdateQuantityCopyWith<$Res> {
  __$$_UpdateQuantityCopyWithImpl(
      _$_UpdateQuantity _value, $Res Function(_$_UpdateQuantity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUser = null,
    Object? lineId = null,
    Object? checkoutId = null,
    Object? quantity = null,
  }) {
    return _then(_$_UpdateQuantity(
      null == getUser
          ? _value.getUser
          : getUser // ignore: cast_nullable_to_non_nullable
              as Future<User>,
      null == lineId
          ? _value.lineId
          : lineId // ignore: cast_nullable_to_non_nullable
              as String,
      null == checkoutId
          ? _value.checkoutId
          : checkoutId // ignore: cast_nullable_to_non_nullable
              as String,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UpdateQuantity implements _UpdateQuantity {
  const _$_UpdateQuantity(
      this.getUser, this.lineId, this.checkoutId, this.quantity);

  @override
  final Future<User> getUser;
  @override
  final String lineId;
  @override
  final String checkoutId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartEvent.updateQuantity(getUser: $getUser, lineId: $lineId, checkoutId: $checkoutId, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateQuantity &&
            (identical(other.getUser, getUser) || other.getUser == getUser) &&
            (identical(other.lineId, lineId) || other.lineId == lineId) &&
            (identical(other.checkoutId, checkoutId) ||
                other.checkoutId == checkoutId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, getUser, lineId, checkoutId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      __$$_UpdateQuantityCopyWithImpl<_$_UpdateQuantity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) {
    return updateQuantity(getUser, lineId, checkoutId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) {
    return updateQuantity?.call(getUser, lineId, checkoutId, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(getUser, lineId, checkoutId, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements CartEvent {
  const factory _UpdateQuantity(final Future<User> getUser, final String lineId,
      final String checkoutId, final int quantity) = _$_UpdateQuantity;

  Future<User> get getUser;
  String get lineId;
  String get checkoutId;
  int get quantity;
  @JsonKey(ignore: true)
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateAddressCopyWith<$Res> {
  factory _$$_UpdateAddressCopyWith(
          _$_UpdateAddress value, $Res Function(_$_UpdateAddress) then) =
      __$$_UpdateAddressCopyWithImpl<$Res>;
  @useResult
  $Res call({Future<User?> user, Address address, String checkoutId});
}

/// @nodoc
class __$$_UpdateAddressCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_UpdateAddress>
    implements _$$_UpdateAddressCopyWith<$Res> {
  __$$_UpdateAddressCopyWithImpl(
      _$_UpdateAddress _value, $Res Function(_$_UpdateAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? address = null,
    Object? checkoutId = null,
  }) {
    return _then(_$_UpdateAddress(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Future<User?>,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      null == checkoutId
          ? _value.checkoutId
          : checkoutId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateAddress implements _UpdateAddress {
  const _$_UpdateAddress(this.user, this.address, this.checkoutId);

  @override
  final Future<User?> user;
  @override
  final Address address;
  @override
  final String checkoutId;

  @override
  String toString() {
    return 'CartEvent.updateAddress(user: $user, address: $address, checkoutId: $checkoutId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateAddress &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.checkoutId, checkoutId) ||
                other.checkoutId == checkoutId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, address, checkoutId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateAddressCopyWith<_$_UpdateAddress> get copyWith =>
      __$$_UpdateAddressCopyWithImpl<_$_UpdateAddress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) {
    return updateAddress(user, address, checkoutId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) {
    return updateAddress?.call(user, address, checkoutId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) {
    if (updateAddress != null) {
      return updateAddress(user, address, checkoutId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) {
    return updateAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) {
    return updateAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) {
    if (updateAddress != null) {
      return updateAddress(this);
    }
    return orElse();
  }
}

abstract class _UpdateAddress implements CartEvent {
  const factory _UpdateAddress(final Future<User?> user, final Address address,
      final String checkoutId) = _$_UpdateAddress;

  Future<User?> get user;
  Address get address;
  String get checkoutId;
  @JsonKey(ignore: true)
  _$$_UpdateAddressCopyWith<_$_UpdateAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PlaceOrderCopyWith<$Res> {
  factory _$$_PlaceOrderCopyWith(
          _$_PlaceOrder value, $Res Function(_$_PlaceOrder) then) =
      __$$_PlaceOrderCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Future<User?> user,
      String methodId,
      List<Map<String, String>> metadata});
}

/// @nodoc
class __$$_PlaceOrderCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_PlaceOrder>
    implements _$$_PlaceOrderCopyWith<$Res> {
  __$$_PlaceOrderCopyWithImpl(
      _$_PlaceOrder _value, $Res Function(_$_PlaceOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? methodId = null,
    Object? metadata = null,
  }) {
    return _then(_$_PlaceOrder(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Future<User?>,
      null == methodId
          ? _value.methodId
          : methodId // ignore: cast_nullable_to_non_nullable
              as String,
      null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc

class _$_PlaceOrder implements _PlaceOrder {
  const _$_PlaceOrder(
      this.user, this.methodId, final List<Map<String, String>> metadata)
      : _metadata = metadata;

  @override
  final Future<User?> user;
  @override
  final String methodId;
  final List<Map<String, String>> _metadata;
  @override
  List<Map<String, String>> get metadata {
    if (_metadata is EqualUnmodifiableListView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_metadata);
  }

  @override
  String toString() {
    return 'CartEvent.placeOrder(user: $user, methodId: $methodId, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceOrder &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.methodId, methodId) ||
                other.methodId == methodId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, methodId,
      const DeepCollectionEquality().hash(_metadata));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceOrderCopyWith<_$_PlaceOrder> get copyWith =>
      __$$_PlaceOrderCopyWithImpl<_$_PlaceOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) {
    return placeOrder(user, methodId, metadata);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) {
    return placeOrder?.call(user, methodId, metadata);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) {
    if (placeOrder != null) {
      return placeOrder(user, methodId, metadata);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) {
    return placeOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) {
    return placeOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) {
    if (placeOrder != null) {
      return placeOrder(this);
    }
    return orElse();
  }
}

abstract class _PlaceOrder implements CartEvent {
  const factory _PlaceOrder(final Future<User?> user, final String methodId,
      final List<Map<String, String>> metadata) = _$_PlaceOrder;

  Future<User?> get user;
  String get methodId;
  List<Map<String, String>> get metadata;
  @JsonKey(ignore: true)
  _$$_PlaceOrderCopyWith<_$_PlaceOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveCobonCopyWith<$Res> {
  factory _$$_RemoveCobonCopyWith(
          _$_RemoveCobon value, $Res Function(_$_RemoveCobon) then) =
      __$$_RemoveCobonCopyWithImpl<$Res>;
  @useResult
  $Res call({Future<User> user, String checkoutId, String cobon});
}

/// @nodoc
class __$$_RemoveCobonCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_RemoveCobon>
    implements _$$_RemoveCobonCopyWith<$Res> {
  __$$_RemoveCobonCopyWithImpl(
      _$_RemoveCobon _value, $Res Function(_$_RemoveCobon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? checkoutId = null,
    Object? cobon = null,
  }) {
    return _then(_$_RemoveCobon(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Future<User>,
      null == checkoutId
          ? _value.checkoutId
          : checkoutId // ignore: cast_nullable_to_non_nullable
              as String,
      null == cobon
          ? _value.cobon
          : cobon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RemoveCobon implements _RemoveCobon {
  const _$_RemoveCobon(this.user, this.checkoutId, this.cobon);

  @override
  final Future<User> user;
  @override
  final String checkoutId;
  @override
  final String cobon;

  @override
  String toString() {
    return 'CartEvent.removeCobon(user: $user, checkoutId: $checkoutId, cobon: $cobon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveCobon &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.checkoutId, checkoutId) ||
                other.checkoutId == checkoutId) &&
            (identical(other.cobon, cobon) || other.cobon == cobon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, checkoutId, cobon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveCobonCopyWith<_$_RemoveCobon> get copyWith =>
      __$$_RemoveCobonCopyWithImpl<_$_RemoveCobon>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) {
    return removeCobon(user, checkoutId, cobon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) {
    return removeCobon?.call(user, checkoutId, cobon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) {
    if (removeCobon != null) {
      return removeCobon(user, checkoutId, cobon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) {
    return removeCobon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) {
    return removeCobon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) {
    if (removeCobon != null) {
      return removeCobon(this);
    }
    return orElse();
  }
}

abstract class _RemoveCobon implements CartEvent {
  const factory _RemoveCobon(final Future<User> user, final String checkoutId,
      final String cobon) = _$_RemoveCobon;

  Future<User> get user;
  String get checkoutId;
  String get cobon;
  @JsonKey(ignore: true)
  _$$_RemoveCobonCopyWith<_$_RemoveCobon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddCobonCopyWith<$Res> {
  factory _$$_AddCobonCopyWith(
          _$_AddCobon value, $Res Function(_$_AddCobon) then) =
      __$$_AddCobonCopyWithImpl<$Res>;
  @useResult
  $Res call({Future<User> user, String checkoutId, String cobon});
}

/// @nodoc
class __$$_AddCobonCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_AddCobon>
    implements _$$_AddCobonCopyWith<$Res> {
  __$$_AddCobonCopyWithImpl(
      _$_AddCobon _value, $Res Function(_$_AddCobon) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? checkoutId = null,
    Object? cobon = null,
  }) {
    return _then(_$_AddCobon(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Future<User>,
      null == checkoutId
          ? _value.checkoutId
          : checkoutId // ignore: cast_nullable_to_non_nullable
              as String,
      null == cobon
          ? _value.cobon
          : cobon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddCobon implements _AddCobon {
  const _$_AddCobon(this.user, this.checkoutId, this.cobon);

  @override
  final Future<User> user;
  @override
  final String checkoutId;
  @override
  final String cobon;

  @override
  String toString() {
    return 'CartEvent.addCobon(user: $user, checkoutId: $checkoutId, cobon: $cobon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCobon &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.checkoutId, checkoutId) ||
                other.checkoutId == checkoutId) &&
            (identical(other.cobon, cobon) || other.cobon == cobon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, checkoutId, cobon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCobonCopyWith<_$_AddCobon> get copyWith =>
      __$$_AddCobonCopyWithImpl<_$_AddCobon>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Future<User> getUser) started,
    required TResult Function(
            Future<User?> getUser, String variantId, int quantity)
        addItem,
    required TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)
        deleteItem,
    required TResult Function(Future<User> getUser, String lineId,
            String checkoutId, int quantity)
        updateQuantity,
    required TResult Function(
            Future<User?> user, Address address, String checkoutId)
        updateAddress,
    required TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)
        placeOrder,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        removeCobon,
    required TResult Function(
            Future<User> user, String checkoutId, String cobon)
        addCobon,
  }) {
    return addCobon(user, checkoutId, cobon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Future<User> getUser)? started,
    TResult? Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult? Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult? Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult? Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult? Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult? Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
  }) {
    return addCobon?.call(user, checkoutId, cobon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Future<User> getUser)? started,
    TResult Function(Future<User?> getUser, String variantId, int quantity)?
        addItem,
    TResult Function(
            Future<User> getUser, List<String> linesIds, String checkoutId)?
        deleteItem,
    TResult Function(Future<User> getUser, String lineId, String checkoutId,
            int quantity)?
        updateQuantity,
    TResult Function(Future<User?> user, Address address, String checkoutId)?
        updateAddress,
    TResult Function(Future<User?> user, String methodId,
            List<Map<String, String>> metadata)?
        placeOrder,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        removeCobon,
    TResult Function(Future<User> user, String checkoutId, String cobon)?
        addCobon,
    required TResult orElse(),
  }) {
    if (addCobon != null) {
      return addCobon(user, checkoutId, cobon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_addItem value) addItem,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateAddress value) updateAddress,
    required TResult Function(_PlaceOrder value) placeOrder,
    required TResult Function(_RemoveCobon value) removeCobon,
    required TResult Function(_AddCobon value) addCobon,
  }) {
    return addCobon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_addItem value)? addItem,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_UpdateQuantity value)? updateQuantity,
    TResult? Function(_UpdateAddress value)? updateAddress,
    TResult? Function(_PlaceOrder value)? placeOrder,
    TResult? Function(_RemoveCobon value)? removeCobon,
    TResult? Function(_AddCobon value)? addCobon,
  }) {
    return addCobon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_addItem value)? addItem,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateAddress value)? updateAddress,
    TResult Function(_PlaceOrder value)? placeOrder,
    TResult Function(_RemoveCobon value)? removeCobon,
    TResult Function(_AddCobon value)? addCobon,
    required TResult orElse(),
  }) {
    if (addCobon != null) {
      return addCobon(this);
    }
    return orElse();
  }
}

abstract class _AddCobon implements CartEvent {
  const factory _AddCobon(final Future<User> user, final String checkoutId,
      final String cobon) = _$_AddCobon;

  Future<User> get user;
  String get checkoutId;
  String get cobon;
  @JsonKey(ignore: true)
  _$$_AddCobonCopyWith<_$_AddCobon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Checkout? checkout) initial,
    required TResult Function() loading,
    required TResult Function(Checkout checkout, String title, String message)
        ready,
    required TResult Function(Order order) readyOrder,
    required TResult Function(Checkout checkout, String title, String message)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Checkout? checkout)? initial,
    TResult? Function()? loading,
    TResult? Function(Checkout checkout, String title, String message)? ready,
    TResult? Function(Order order)? readyOrder,
    TResult? Function(Checkout checkout, String title, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Checkout? checkout)? initial,
    TResult Function()? loading,
    TResult Function(Checkout checkout, String title, String message)? ready,
    TResult Function(Order order)? readyOrder,
    TResult Function(Checkout checkout, String title, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Ready value) ready,
    required TResult Function(_ReadyOrder value) readyOrder,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_ReadyOrder value)? readyOrder,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Ready value)? ready,
    TResult Function(_ReadyOrder value)? readyOrder,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

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
  $Res call({Checkout? checkout});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkout = freezed,
  }) {
    return _then(_$_Initial(
      freezed == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as Checkout?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(this.checkout);

  @override
  final Checkout? checkout;

  @override
  String toString() {
    return 'CartState.initial(checkout: $checkout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Checkout? checkout) initial,
    required TResult Function() loading,
    required TResult Function(Checkout checkout, String title, String message)
        ready,
    required TResult Function(Order order) readyOrder,
    required TResult Function(Checkout checkout, String title, String message)
        error,
  }) {
    return initial(checkout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Checkout? checkout)? initial,
    TResult? Function()? loading,
    TResult? Function(Checkout checkout, String title, String message)? ready,
    TResult? Function(Order order)? readyOrder,
    TResult? Function(Checkout checkout, String title, String message)? error,
  }) {
    return initial?.call(checkout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Checkout? checkout)? initial,
    TResult Function()? loading,
    TResult Function(Checkout checkout, String title, String message)? ready,
    TResult Function(Order order)? readyOrder,
    TResult Function(Checkout checkout, String title, String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(checkout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Ready value) ready,
    required TResult Function(_ReadyOrder value) readyOrder,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_ReadyOrder value)? readyOrder,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Ready value)? ready,
    TResult Function(_ReadyOrder value)? readyOrder,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial(final Checkout? checkout) = _$_Initial;

  Checkout? get checkout;
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
    extends _$CartStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'CartState.loading()';
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
    required TResult Function(Checkout? checkout) initial,
    required TResult Function() loading,
    required TResult Function(Checkout checkout, String title, String message)
        ready,
    required TResult Function(Order order) readyOrder,
    required TResult Function(Checkout checkout, String title, String message)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Checkout? checkout)? initial,
    TResult? Function()? loading,
    TResult? Function(Checkout checkout, String title, String message)? ready,
    TResult? Function(Order order)? readyOrder,
    TResult? Function(Checkout checkout, String title, String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Checkout? checkout)? initial,
    TResult Function()? loading,
    TResult Function(Checkout checkout, String title, String message)? ready,
    TResult Function(Order order)? readyOrder,
    TResult Function(Checkout checkout, String title, String message)? error,
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
    required TResult Function(_Ready value) ready,
    required TResult Function(_ReadyOrder value) readyOrder,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_ReadyOrder value)? readyOrder,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Ready value)? ready,
    TResult Function(_ReadyOrder value)? readyOrder,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CartState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ReadyCopyWith<$Res> {
  factory _$$_ReadyCopyWith(_$_Ready value, $Res Function(_$_Ready) then) =
      __$$_ReadyCopyWithImpl<$Res>;
  @useResult
  $Res call({Checkout checkout, String title, String message});
}

/// @nodoc
class __$$_ReadyCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_Ready>
    implements _$$_ReadyCopyWith<$Res> {
  __$$_ReadyCopyWithImpl(_$_Ready _value, $Res Function(_$_Ready) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkout = null,
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$_Ready(
      null == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as Checkout,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Ready implements _Ready {
  const _$_Ready(this.checkout, this.title, this.message);

  @override
  final Checkout checkout;
  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'CartState.ready(checkout: $checkout, title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ready &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkout, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadyCopyWith<_$_Ready> get copyWith =>
      __$$_ReadyCopyWithImpl<_$_Ready>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Checkout? checkout) initial,
    required TResult Function() loading,
    required TResult Function(Checkout checkout, String title, String message)
        ready,
    required TResult Function(Order order) readyOrder,
    required TResult Function(Checkout checkout, String title, String message)
        error,
  }) {
    return ready(checkout, title, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Checkout? checkout)? initial,
    TResult? Function()? loading,
    TResult? Function(Checkout checkout, String title, String message)? ready,
    TResult? Function(Order order)? readyOrder,
    TResult? Function(Checkout checkout, String title, String message)? error,
  }) {
    return ready?.call(checkout, title, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Checkout? checkout)? initial,
    TResult Function()? loading,
    TResult Function(Checkout checkout, String title, String message)? ready,
    TResult Function(Order order)? readyOrder,
    TResult Function(Checkout checkout, String title, String message)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(checkout, title, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Ready value) ready,
    required TResult Function(_ReadyOrder value) readyOrder,
    required TResult Function(_Error value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_ReadyOrder value)? readyOrder,
    TResult? Function(_Error value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Ready value)? ready,
    TResult Function(_ReadyOrder value)? readyOrder,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _Ready implements CartState {
  const factory _Ready(
          final Checkout checkout, final String title, final String message) =
      _$_Ready;

  Checkout get checkout;
  String get title;
  String get message;
  @JsonKey(ignore: true)
  _$$_ReadyCopyWith<_$_Ready> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReadyOrderCopyWith<$Res> {
  factory _$$_ReadyOrderCopyWith(
          _$_ReadyOrder value, $Res Function(_$_ReadyOrder) then) =
      __$$_ReadyOrderCopyWithImpl<$Res>;
  @useResult
  $Res call({Order order});
}

/// @nodoc
class __$$_ReadyOrderCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_ReadyOrder>
    implements _$$_ReadyOrderCopyWith<$Res> {
  __$$_ReadyOrderCopyWithImpl(
      _$_ReadyOrder _value, $Res Function(_$_ReadyOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$_ReadyOrder(
      null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
    ));
  }
}

/// @nodoc

class _$_ReadyOrder implements _ReadyOrder {
  const _$_ReadyOrder(this.order);

  @override
  final Order order;

  @override
  String toString() {
    return 'CartState.readyOrder(order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadyOrder &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(runtimeType, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadyOrderCopyWith<_$_ReadyOrder> get copyWith =>
      __$$_ReadyOrderCopyWithImpl<_$_ReadyOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Checkout? checkout) initial,
    required TResult Function() loading,
    required TResult Function(Checkout checkout, String title, String message)
        ready,
    required TResult Function(Order order) readyOrder,
    required TResult Function(Checkout checkout, String title, String message)
        error,
  }) {
    return readyOrder(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Checkout? checkout)? initial,
    TResult? Function()? loading,
    TResult? Function(Checkout checkout, String title, String message)? ready,
    TResult? Function(Order order)? readyOrder,
    TResult? Function(Checkout checkout, String title, String message)? error,
  }) {
    return readyOrder?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Checkout? checkout)? initial,
    TResult Function()? loading,
    TResult Function(Checkout checkout, String title, String message)? ready,
    TResult Function(Order order)? readyOrder,
    TResult Function(Checkout checkout, String title, String message)? error,
    required TResult orElse(),
  }) {
    if (readyOrder != null) {
      return readyOrder(order);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Ready value) ready,
    required TResult Function(_ReadyOrder value) readyOrder,
    required TResult Function(_Error value) error,
  }) {
    return readyOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_ReadyOrder value)? readyOrder,
    TResult? Function(_Error value)? error,
  }) {
    return readyOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Ready value)? ready,
    TResult Function(_ReadyOrder value)? readyOrder,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (readyOrder != null) {
      return readyOrder(this);
    }
    return orElse();
  }
}

abstract class _ReadyOrder implements CartState {
  const factory _ReadyOrder(final Order order) = _$_ReadyOrder;

  Order get order;
  @JsonKey(ignore: true)
  _$$_ReadyOrderCopyWith<_$_ReadyOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Checkout checkout, String title, String message});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkout = null,
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$_Error(
      null == checkout
          ? _value.checkout
          : checkout // ignore: cast_nullable_to_non_nullable
              as Checkout,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.checkout, this.title, this.message);

  @override
  final Checkout checkout;
  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'CartState.error(checkout: $checkout, title: $title, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.checkout, checkout) ||
                other.checkout == checkout) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkout, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Checkout? checkout) initial,
    required TResult Function() loading,
    required TResult Function(Checkout checkout, String title, String message)
        ready,
    required TResult Function(Order order) readyOrder,
    required TResult Function(Checkout checkout, String title, String message)
        error,
  }) {
    return error(checkout, title, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Checkout? checkout)? initial,
    TResult? Function()? loading,
    TResult? Function(Checkout checkout, String title, String message)? ready,
    TResult? Function(Order order)? readyOrder,
    TResult? Function(Checkout checkout, String title, String message)? error,
  }) {
    return error?.call(checkout, title, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Checkout? checkout)? initial,
    TResult Function()? loading,
    TResult Function(Checkout checkout, String title, String message)? ready,
    TResult Function(Order order)? readyOrder,
    TResult Function(Checkout checkout, String title, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(checkout, title, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Ready value) ready,
    required TResult Function(_ReadyOrder value) readyOrder,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_ReadyOrder value)? readyOrder,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Ready value)? ready,
    TResult Function(_ReadyOrder value)? readyOrder,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CartState {
  const factory _Error(
          final Checkout checkout, final String title, final String message) =
      _$_Error;

  Checkout get checkout;
  String get title;
  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
