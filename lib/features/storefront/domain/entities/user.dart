// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:saleor_app_flutter/core/types/permission_enum.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';

class User {
  String id;
  String email;
  String firstName;
  String lastName;
  String token;
  String refreshToken;
  List<Order> orders;
  List<Checkout> checkouts;
  List<PermissionEnum> userPermission;
  bool isStaff;
  bool isActive;
  List<Address> addresses;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.refreshToken,
    required this.orders,
    required this.checkouts,
    required this.userPermission,
    required this.isStaff,
    required this.isActive,
    required this.addresses,
  });

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, token: $token, refreshToken: $refreshToken, orders: $orders, checkouts: $checkouts, userPermission: $userPermission, isStaff: $isStaff, isActive: $isActive, addresses: $addresses)';
  }

  static User noUser() {
    return User(
        id: '',
        email: '',
        firstName: '',
        lastName: '',
        checkouts: [],
        userPermission: [],
        refreshToken: '',
        token: '',
        isStaff: false,
        isActive: false,
        addresses: [
          Address(
              id: '',
              firstName: '',
              lastName: '',
              streetAddress1: '',
              streetAddress2: '',
              city: '',
              cityArea: '',
              country: '',
              postalCode: '')
        ],
        orders: []);
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.token == token &&
        other.refreshToken == refreshToken &&
        listEquals(other.orders, orders) &&
        listEquals(other.checkouts, checkouts) &&
        listEquals(other.userPermission, userPermission) &&
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
        orders.hashCode ^
        checkouts.hashCode ^
        userPermission.hashCode ^
        isStaff.hashCode ^
        isActive.hashCode ^
        addresses.hashCode;
  }
}
