import 'dart:convert';

import 'package:saleor_app_flutter/features/storefront/domain/entities/order_line.dart';

class OrderLineModel extends OrderLine {
  OrderLineModel(
      {required super.id,
      required super.productName,
      required super.productVariantId,
      required super.quantity,
      required super.thumbnail,
      required super.currency,
      required super.unitPrice,
      required super.totalPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'productVariantId': productVariantId,
      'quantity': quantity,
      'thumbnail': thumbnail,
      'currency': currency,
      'unitPrice': unitPrice,
      'totalPrice': totalPrice,
    };
  }

  @override
  String toString() {
    return 'OrderLine(id: $id, productName: $productName, productVariantId: $productVariantId, quantity: $quantity, thumbnail: $thumbnail, currency: $currency, unitPrice: $unitPrice, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(covariant OrderLine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productName == productName &&
        other.productVariantId == productVariantId &&
        other.quantity == quantity &&
        other.thumbnail == thumbnail &&
        other.currency == currency &&
        other.unitPrice == unitPrice &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productName.hashCode ^
        productVariantId.hashCode ^
        quantity.hashCode ^
        thumbnail.hashCode ^
        currency.hashCode ^
        unitPrice.hashCode ^
        totalPrice.hashCode;
  }

  factory OrderLineModel.fromMap(Map<String, dynamic> map) {
    return OrderLineModel(
      id: map['id'] as String,
      productName: map['productName'] as String,
      productVariantId: map['productVariantId'] as String,
      quantity: map['quantity'] as int,
      thumbnail: map['thumbnail']!=null ?  map['thumbnail']['url'] as String : '',
      currency: map['unitPrice']['gross']['currency'] as String,
      unitPrice: map['unitPrice']['gross']['amount'] as double,
      totalPrice: map['totalPrice']['gross']['amount'] as double,
    );
  }

  factory OrderLineModel.fromStoredMap(Map<String, dynamic> map) {
    return OrderLineModel(
      id: map['id'] as String,
      productName: map['productName'] as String,
      productVariantId: map['productVariantId'] as String,
      quantity: map['quantity'] as int,
      thumbnail: map['thumbnail'] as String,
      currency: map['currency'] as String,
      unitPrice: map['unitPrice'] as double,
      totalPrice: map['totalPrice'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderLineModel.fromJson(String source) =>
      OrderLineModel.fromStoredMap(json.decode(source) as Map<String, dynamic>);
}
