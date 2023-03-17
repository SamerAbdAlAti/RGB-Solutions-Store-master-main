// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';

import 'package:saleor_app_flutter/core/types/order_status.dart';
import 'package:saleor_app_flutter/core/types/payment_charge_status_enum.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order_event.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order_line.dart';

class Order {
  String id;
  String created;
  Map<String, dynamic> metafields;
  OrderStatus status;
  PaymentChargeStatusEnum paymentStatus;
  String unit;
  String currency;
  String number;
  double weight;
  double total;
  List<OrderLine> lines;
  List<OrderEvent> events;
  String userId;
  String firstName;
  String lastName;
  String userPhone;
  Address shippingAddress;
  Order({
    required this.id,
    required this.created,
    required this.metafields,
    required this.number,
    required this.paymentStatus,
    required this.status,
    required this.unit,
    required this.currency,
    required this.weight,
    required this.total,
    required this.lines,
    required this.events,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.userPhone,
    required this.shippingAddress,
  });

  @override
  String toString() {
    return 'Order(id: $id, created: $created, metafields: $metafields, number $number, status: $status,, paymentStatus: $paymentStatus, unit: $unit, currency: $currency, weight: $weight, total: $total, lines: $lines, events: $events, userId: $userId, firstName: $firstName, lastName: $lastName, userPhone: $userPhone, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.created == created &&
        mapEquals(other.metafields, metafields) &&
        other.number == number &&
        other.status == status &&
        other.paymentStatus == paymentStatus &&
        other.unit == unit &&
        other.currency == currency &&
        other.weight == weight &&
        other.total == total &&
        listEquals(other.lines, lines) &&
        listEquals(other.events, events) &&
        other.userId == userId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.userPhone == userPhone &&
        other.shippingAddress == shippingAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        created.hashCode ^
        metafields.hashCode ^
        number.hashCode ^
        status.hashCode ^
        paymentStatus.hashCode ^
        unit.hashCode ^
        currency.hashCode ^
        weight.hashCode ^
        total.hashCode ^
        lines.hashCode ^
        events.hashCode ^
        userId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        userPhone.hashCode ^
        shippingAddress.hashCode;
  }
}
