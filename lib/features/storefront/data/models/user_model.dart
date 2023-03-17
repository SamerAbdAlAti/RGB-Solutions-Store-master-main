// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:saleor_app_flutter/core/types/permission_enum.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/checkout_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/order_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.email,
      required super.firstName,
      required super.lastName,
      required super.orders,
      required super.checkouts,
      required super.userPermission,
      required super.token,
      required super.refreshToken,
      required super.isStaff,
      required super.isActive,
      required super.addresses});

  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    List<OrderModel>? orders,
    String? token,
    String? refreshToken,
    List<CheckoutModel>? checkouts,
    List<PermissionEnum>? userPermission,
    bool? isStaff,
    bool? isActive,
    List<Address>? addresses,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      orders: orders ?? this.orders,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      checkouts: checkouts ?? this.checkouts,
      userPermission: userPermission ?? this.userPermission,
      isStaff: isStaff ?? this.isStaff,
      isActive: isActive ?? this.isActive,
      addresses: addresses ?? this.addresses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'orders': (orders.cast<OrderModel>()).map((e) => e.toJson()).toList(),
      'token': token,
      'refreshToken': refreshToken,
      'checkouts':
          (checkouts.cast<CheckoutModel>()).map((x) => x.toJson()).toList(),
      'userPermission': (userPermission).map((x) => x.toJson()).toList(),
      'isStaff': isStaff,
      'isActive': isActive,
      'addresses':
          (addresses.cast<AddressModel>()).map((x) => x.toJson()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      orders: map['orders'] != null
          ? (map['orders']).isNotEmpty
              ? List<OrderModel>.from((map['orders']['edges']).map<OrderModel>(
                  (x) => OrderModel.fromMap(x['node'] as Map<String, dynamic>),
                ))
              : []
          : [],
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
      isStaff: map['isStaff'] as bool,
      isActive: map['isActive'] as bool,
      checkouts: (map['checkouts']).isNotEmpty
          ? List<CheckoutModel>.from(
              (map['checkouts']['edges']).map<CheckoutModel>(
              (x) => CheckoutModel.fromMap(x['node'] as Map<String, dynamic>),
            ))
          : [],
      userPermission: List<PermissionEnum>.from(
          (map['userPermissions'] as List<dynamic>)
              .map<PermissionEnum>((e) => PermissionEnum.fromJson(e['code']))),
      addresses: List<AddressModel>.from(
        (map['addresses'] as List<dynamic>)
            .map<AddressModel>((x) => AddressModel.fromMap(x)),
      ),
    );
  }

  factory UserModel.fromStoredMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      orders: List<OrderModel>.from(
        (map['orders'] as List<dynamic>).map<OrderModel>(
          (x) => OrderModel.fromJson(x as String),
        ),
      ),
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
      checkouts: List<CheckoutModel>.from(
        (map['checkouts'] as List<dynamic>).map<CheckoutModel>(
          (x) => CheckoutModel.fromJson(x as String),
        ),
      ),
      userPermission: List<PermissionEnum>.from(
        (map['userPermission'] as List<dynamic>).map<PermissionEnum>(
          (x) => PermissionEnum.fromJson(x),
        ),
      ),
      isStaff: map['isStaff'] as bool,
      isActive: map['isActive'] as bool,
      addresses: List<AddressModel>.from(
        (map['addresses'] as List<dynamic>).map<AddressModel>(
          (x) => AddressModel.fromJson(x as String),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromStoredMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, token: $token, refreshToken: $refreshToken, isStaff: $isStaff, isActive: $isActive, addresses: $addresses)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.token == token &&
        other.refreshToken == refreshToken &&
        other.isStaff == isStaff &&
        other.isActive == isActive &&
        listEquals(other.addresses, addresses);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        token.hashCode ^
        refreshToken.hashCode ^
        isStaff.hashCode ^
        isActive.hashCode ^
        addresses.hashCode;
  }
}
