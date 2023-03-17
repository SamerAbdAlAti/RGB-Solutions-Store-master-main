import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:saleor_app_flutter/core/types/order_status.dart';
import 'package:saleor_app_flutter/core/types/payment_charge_status_enum.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/order_event_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/order_line_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order.dart';

class OrderModel extends Order {
  OrderModel(
      {required super.id,
      required super.created,
      required super.metafields,
      required super.status,
      required super.paymentStatus,
      required super.lines,
      required super.userId,
      required super.firstName,
      required super.lastName,
      required super.userPhone,
      required super.shippingAddress,
      required super.unit,
      required super.currency,
      required super.weight,
      required super.total,
      required super.number,
      required super.events});

  @override
  String toString() {
    return 'Order(id: $id, created: $created, metafields: $metafields, number $number, status: $status,, paymentStatus: $paymentStatus, unit: $unit, currency: $currency, weight: $weight, total: $total, lines: $lines, events: $events, userId: $userId, firstName: $firstName, lastName: $lastName, userPhone: $userPhone, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created': created,
      'metafields': metafields,
      'status': status.toJson(),
      'paymentStatus': paymentStatus.toJson(),
      'number': number,
      'total': total,
      'currency': currency,
      'unit': unit,
      'weight': weight,
      'lines': (lines as List<OrderLineModel>).map((x) => x.toMap()).toList(),
      'events': (events.cast<OrderEventModel>()).map((e) => e.toMap()).toList(),
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'userPhone': userPhone,
      'shippingAddress': (shippingAddress as AddressModel).toMap(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      created: map['created'] as String,
      metafields: Map<String, dynamic>.from(
          (map['metafields'] as Map<String, dynamic>)),
      number: map['number'],
      status: OrderStatus.fromJson(map['status']),
      paymentStatus:
          PaymentChargeStatusEnum.fromJson(map['paymentStatus'] as String),
      lines: List<OrderLineModel>.from(
        (map['lines'] as List<dynamic>).map<OrderLineModel>(
          (x) => OrderLineModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      events: List<OrderEventModel>.from(
        (map['events'] as List<dynamic>).map<OrderEventModel>(
          (x) => OrderEventModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      userId: map['user']['id'] as String,
      firstName: map['user']['firstName'] as String,
      lastName: map['user']['lastName'] as String,
      userPhone: map['userEmail'] as String,
      shippingAddress:
          AddressModel.fromMap(map['shippingAddress'] as Map<String, dynamic>),
      currency: map['total']['gross']['currency'] as String,
      total: map['total']['gross']['amount'] as double,
      unit: map['weight']['unit'] as String,
      weight: map['weight']['value'] as double,
    );
  }

  factory OrderModel.fromStoredMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      created: map['created'] as String,
      metafields: Map<String, dynamic>.from(
        (map['metafields'] as Map<String, dynamic>),
      ),
      number: map['number'],
      paymentStatus: PaymentChargeStatusEnum.fromJson(map['paymentStatus']),
      lines: List<OrderLineModel>.from(
        (map['lines'] as List<dynamic>).map<OrderLineModel>(
          (x) => OrderLineModel.fromStoredMap(x),
        ),
      ),
      events: List<OrderEventModel>.from(
        (map['events'] as List<dynamic>).map<OrderEventModel>(
          (x) => OrderEventModel.fromStoredMap(x),
        ),
      ),
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      userPhone: map['userPhone'] as String,
      shippingAddress: AddressModel.fromStoredMap(map['shippingAddress']),
      status: OrderStatus.fromJson(map['status']),
      currency: map['currency'] as String,
      total: map['total'] as double,
      unit: map['unit'] as String,
      weight: map['weight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromStoredMap(json.decode(source) as Map<String, dynamic>);
}
