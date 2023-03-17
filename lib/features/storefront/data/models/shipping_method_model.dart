import 'dart:convert';

import 'package:saleor_app_flutter/features/storefront/domain/entities/shipping_method.dart';

class ShippingMethodModel extends ShippingMethod {
  ShippingMethodModel(
      {required super.id,
      required super.name,
      super.description,
      required super.price,
      required super.currency,
      super.maximumDeliveryDays,
      required super.minimumDeliveryDays});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'currency': currency,
      'maximumDeliveryDays': maximumDeliveryDays,
      'minimumDeliveryDays': minimumDeliveryDays,
    };
  }

  factory ShippingMethodModel.fromMap(Map<String, dynamic> map) {
    String desc = map['description'] != null
        ? json
            .decode(map['description'])['blocks'][0]['data']['text']
            .replaceAll('<b>', '*')
            .replaceAll('</b>', '*')
        : null;
    return ShippingMethodModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: desc,
      price: map['price']['amount'] as double,
      currency: map['price']['currency'] as String,
      maximumDeliveryDays: map['maximumDeliveryDays'] != null
          ? map['maximumDeliveryDays'] as int
          : null,
      minimumDeliveryDays: map['minimumDeliveryDays'] != null
          ? map['minimumDeliveryDays'] as int
          : null,
    );
  }

  factory ShippingMethodModel.fromStoredMap(Map<String, dynamic> map) {
    return ShippingMethodModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      price: map['price'] as double,
      currency: map['currency'] as String,
      maximumDeliveryDays: map['maximumDeliveryDays'] != null
          ? map['maximumDeliveryDays'] as int
          : null,
      minimumDeliveryDays: map['minimumDeliveryDays'] != null
          ? map['minimumDeliveryDays'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShippingMethodModel.fromJson(String source) {
    return ShippingMethodModel.fromStoredMap(
        json.decode(source) as Map<String, dynamic>);
  }
}
