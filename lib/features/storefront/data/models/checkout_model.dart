import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/checkout_line_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/shipping_method_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';

class CheckoutModel extends Checkout {
  CheckoutModel(
      {required super.id,
      required super.metafields,
      super.discountName,
      super.translatedDiscountName,
      super.voucherCode,
      required super.currency,
      required super.quantity,
      required super.lines,
      required super.discountAmount,
      required super.shippingPrice,
      required super.subtotalPrice,
      required super.shippingMethods,
      super.shippingAddress});

  factory CheckoutModel.fromMap(Map<String, dynamic> map) {
    return CheckoutModel(
        id: map['id'] as String,
        metafields: Map<String, dynamic>.from(
            (map['metafields'] as Map<String, dynamic>)),
        currency: map['discount']['currency'] as String,
        discountName:
            map['discountName'] != null ? map['discountName'] as String : null,
        translatedDiscountName: map['translatedDiscountName'] != null
            ? map['translatedDiscountName'] as String
            : null,
        voucherCode:
            map['voucherCode'] != null ? map['voucherCode'] as String : null,
        quantity: map['quantity'] as int,
        lines: List<CheckoutLineModel>.from(
          map['lines'].map<CheckoutLineModel>(
            (x) => CheckoutLineModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        discountAmount: map['discount']['amount'] as double,
        shippingMethods: List<ShippingMethodModel>.from(
          map['shippingMethods'].map<ShippingMethodModel>(
            (x) => ShippingMethodModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        shippingAddress: map['shippingAddress'] != null
            ? AddressModel.fromMap(map['shippingAddress'])
            : null,
        subtotalPrice: map['subtotalPrice']['gross']['amount'],
        shippingPrice: map['shippingPrice']['gross']['amount']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'metafields': metafields,
      'currency': currency,
      'discountName': discountName,
      'translatedDiscountName': translatedDiscountName,
      'voucherCode': voucherCode,
      'quantity': quantity,
      'subtotalPrice': subtotalPrice,
      'shippingPrice': shippingPrice,
      'lines':
          (lines as List<CheckoutLineModel>).map((x) => x.toMap()).toList(),
      'discountAmount': discountAmount,
      'shippingMethods': (shippingMethods as List<ShippingMethodModel>)
          .map((e) => e.toJson())
          .toList(),
      'shippingAddress': shippingAddress != null
          ? (shippingAddress as AddressModel).toJson()
          : null
    };
  }

  factory CheckoutModel.fromStoredMap(Map<String, dynamic> map) {
    return CheckoutModel(
        id: map['id'] as String,
        metafields: Map<String, dynamic>.from(
            (map['metafields'] as Map<String, dynamic>)),
        currency: map['currency'] as String,
        discountName:
            map['discountName'] != null ? map['discountName'] as String : null,
        translatedDiscountName: map['translatedDiscountName'] != null
            ? map['translatedDiscountName'] as String
            : null,
        voucherCode:
            map['voucherCode'] != null ? map['voucherCode'] as String : null,
        quantity: map['quantity'] as int,
        lines: List<CheckoutLineModel>.from(
          (map['lines'] as List<dynamic>).map<CheckoutLineModel>(
            (x) => CheckoutLineModel.fromStoredMap(x as Map<String, dynamic>),
          ),
        ),
        discountAmount: map['discountAmount'] as double,
        shippingMethods: List<ShippingMethodModel>.from(
          (map['shippingMethods'] as List<dynamic>).map<ShippingMethodModel>(
            (x) => ShippingMethodModel.fromJson(x),
          ),
        ),
        shippingAddress: map['shippingAddress'] != null
            ? AddressModel.fromJson(map['shippingAddress'])
            : null,
        shippingPrice: map['shippingPrice'] as double,
        subtotalPrice: map['subtotalPrice'] as double);
  }

  String toJson() => json.encode(toMap());

  factory CheckoutModel.fromJson(String source) =>
      CheckoutModel.fromStoredMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Checkout(id: $id, metafields: $metafields, currency: $currency, discountName: $discountName, translatedDiscountName: $translatedDiscountName, voucherCode: $voucherCode, quantity: $quantity, lines: $lines, shippingPrice: $shippingPrice, discountAmount: $discountAmount, subtotalPrice: $subtotalPrice, shippingMethods: $shippingMethods, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(covariant Checkout other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        mapEquals(other.metafields, metafields) &&
        other.currency == currency &&
        other.discountName == discountName &&
        other.translatedDiscountName == translatedDiscountName &&
        other.voucherCode == voucherCode &&
        other.quantity == quantity &&
        listEquals(other.lines, lines) &&
        other.shippingPrice == shippingPrice &&
        other.discountAmount == discountAmount &&
        other.subtotalPrice == subtotalPrice &&
        listEquals(other.shippingMethods, shippingMethods) &&
        other.shippingAddress == shippingAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        metafields.hashCode ^
        currency.hashCode ^
        discountName.hashCode ^
        translatedDiscountName.hashCode ^
        voucherCode.hashCode ^
        quantity.hashCode ^
        lines.hashCode ^
        shippingPrice.hashCode ^
        discountAmount.hashCode ^
        subtotalPrice.hashCode ^
        shippingMethods.hashCode ^
        shippingAddress.hashCode;
  }
}
