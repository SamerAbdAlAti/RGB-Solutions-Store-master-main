// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout_line.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/shipping_method.dart';

class Checkout {
  String id;
  Map<String, dynamic> metafields;
  String currency;
  String? discountName;
  String? translatedDiscountName;
  String? voucherCode;
  int quantity;
  List<CheckoutLine> lines;
  double shippingPrice;
  double discountAmount;
  double subtotalPrice;
  List<ShippingMethod> shippingMethods;
  Address? shippingAddress;
  Checkout({
    required this.id,
    required this.metafields,
    required this.currency,
    this.discountName,
    this.translatedDiscountName,
    this.voucherCode,
    required this.quantity,
    required this.lines,
    required this.shippingPrice,
    required this.discountAmount,
    required this.subtotalPrice,
    required this.shippingMethods,
    this.shippingAddress
  });

  @override
  String toString() {
    return 'Checkout(id: $id, metafields: $metafields, currency: $currency, discountName: $discountName, translatedDiscountName: $translatedDiscountName, voucherCode: $voucherCode, quantity: $quantity, lines: $lines, shippingPrice: $shippingPrice, discountAmount: $discountAmount, subtotalPrice: $subtotalPrice, shippingMethods: $shippingMethods, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(covariant Checkout other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
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
