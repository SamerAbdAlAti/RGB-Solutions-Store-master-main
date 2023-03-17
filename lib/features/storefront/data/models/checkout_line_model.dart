import 'dart:convert';

import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout_line.dart';

class CheckoutLineModel extends CheckoutLine {
  CheckoutLineModel({
    required super.id,
    required super.quantity,
    required super.variantId,
    required super.variantName,
    required super.product,
    required super.currency,
    required super.unitPrice,
    required super.undiscountedPrice,
    required super.totalPrice,
  });

  factory CheckoutLineModel.fromMap(Map<String, dynamic> map) {
    return CheckoutLineModel(
        id: map['id'] as String,
        quantity: map['quantity'] as int,
        variantId: map['variant']['id'] as String,
        variantName: map['variant']['name'] as String,
        product: ProductModel.fromMap(
            map['variant']['product'] as Map<String, dynamic>, null),
        currency: map['unitPrice']['gross']['currency'] as String,
        unitPrice: map['unitPrice']['gross']['amount'] as double,
        undiscountedPrice: map['undiscountedUnitPrice']['amount'] as double,
        totalPrice: map['totalPrice']['gross']['amount']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'variantId': variantId,
      'variantName': variantName,
      'product': (product as ProductModel).toMap(),
      'currency': currency,
      'unitPrice': unitPrice,
      'undiscountedPrice': undiscountedPrice,
      'totalPrice': totalPrice
    };
  }

  factory CheckoutLineModel.fromStoredMap(Map<String, dynamic> map) {
    return CheckoutLineModel(
        id: map['id'] as String,
        quantity: map['quantity'] as int,
        variantId: map['variantId'] as String,
        variantName: map['variantName'] as String,
        product:
            ProductModel.fromStoredMap(map['product'] as Map<String, dynamic>),
        currency: map['currency'] as String,
        unitPrice: map['unitPrice'] as double,
        undiscountedPrice: map['undiscountedPrice'] as double,
        totalPrice: map['totalPrice'] as double);
  }

  String toJson() => json.encode(toMap());

  factory CheckoutLineModel.fromJson(String source) =>
      CheckoutLineModel.fromStoredMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckoutLine(id: $id, quantity: $quantity, variantId: $variantId, variantName: $variantName, product: $product, currency: $currency, unitPrice: $unitPrice, undiscountedPrice: $undiscountedPrice, totalPrice:$totalPrice)';
  }

  @override
  bool operator ==(covariant CheckoutLine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.quantity == quantity &&
        other.variantId == variantId &&
        other.variantName == variantName &&
        other.product == product &&
        other.currency == currency &&
        other.unitPrice == unitPrice &&
        other.undiscountedPrice == undiscountedPrice &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        quantity.hashCode ^
        variantId.hashCode ^
        variantName.hashCode ^
        product.hashCode ^
        currency.hashCode ^
        unitPrice.hashCode ^
        undiscountedPrice.hashCode ^
        totalPrice.hashCode;
  }
}
