import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/attribute_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product_variant.dart';

import 'attribute_value.dart';

class ProductVariantModel extends ProductVariant {
  ProductVariantModel(
      {required super.id,
      required super.name,
      required super.quantityAvailable,
      super.quantityLimitPerCustomer,
      super.unit,
      super.weight,
      required super.media,
      required super.onSale,
      required super.currency,
      required super.price,
      required super.priceUndiscounted,
      super.discount,
      required super.attributes,
      required super.values});

  @override
  String toString() {
    return 'ProductVariant(id: $id, name: $name, quantityAvailable: $quantityAvailable, quantityLimitPerCustomer: $quantityLimitPerCustomer, unit: $unit, weight: $weight, media: $media, attributes: $attributes, values: $values, onSale: $onSale, currency: $currency, discount: $discount, price: $price, priceUndiscounted: $priceUndiscounted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductVariantModel &&
        other.id == id &&
        other.name == name &&
        other.quantityAvailable == quantityAvailable &&
        other.quantityLimitPerCustomer == quantityLimitPerCustomer &&
        other.unit == unit &&
        other.weight == weight &&
        listEquals(other.media, media) &&
        listEquals(other.attributes, attributes) &&
        listEquals(other.values, values) &&
        other.onSale == onSale &&
        other.currency == currency &&
        other.discount == discount &&
        other.price == price &&
        other.priceUndiscounted == priceUndiscounted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        quantityAvailable.hashCode ^
        quantityLimitPerCustomer.hashCode ^
        unit.hashCode ^
        weight.hashCode ^
        media.hashCode ^
        attributes.hashCode ^
        values.hashCode ^
        onSale.hashCode ^
        currency.hashCode ^
        discount.hashCode ^
        price.hashCode ^
        priceUndiscounted.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantityAvailable': quantityAvailable,
      'quantityLimitPerCustomer': quantityLimitPerCustomer,
      'unit': unit,
      'weight': weight,
      'attributes':
          attributes.cast<AttributeModel>().map((x) => x.toMap()).toList(),
      'values':
          values.cast<ProductVariantModel>().map((x) => x.toMap()).toList(),
      'media': media,
      'onSale': onSale,
      'currency': currency,
      'discount': discount,
      'price': price,
      'priceUndiscounted': priceUndiscounted,
    };
  }

  factory ProductVariantModel.fromStoredMap(Map<String, dynamic> map) {
    return ProductVariantModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      quantityAvailable: map['quantityAvailable']?.toInt() ?? 0,
      quantityLimitPerCustomer: map['quantityLimitPerCustomer']?.toInt(),
      unit: map['unit'] ?? '',
      weight: map['weight']?.toDouble() ?? 0.0,
      media: List<String>.from(map['media']),
      onSale: map['onSale'] ?? false,
      currency: map['currency'] ?? '',
      discount: map['discount']?.toDouble(),
      price: map['price']?.toDouble() ?? 0.0,
      priceUndiscounted: map['priceUndiscounted']?.toDouble() ?? 0.0,
      values: List<AttributeValueModel>.from(
          map['values']?.map((x) => AttributeValueModel.fromStoredMap(x))),
      attributes: List<AttributeModel>.from(
          map['attributes']?.map((x) => AttributeModel.fromStoredMap(x))),
    );
  }

  factory ProductVariantModel.fromMap(Map<String, dynamic> map) {
    List<AttributeValueModel> valuesList = [];

    if ((map['attributes'] as List<dynamic>).isNotEmpty) {
      for (var element in (map['attributes'] as List<dynamic>)) {
        for (var element2 in (element['values'] as List<dynamic>)) {
          valuesList.add(AttributeValueModel.fromMap(element2));
        }
      }
    }
    return ProductVariantModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      quantityAvailable: map['quantityAvailable']?.toInt() ?? 0,
      quantityLimitPerCustomer: map['quantityLimitPerCustomer']?.toInt(),
      unit: map['weight'] != null ? map['weight']['unit'] : null,
      weight: map['weight'] != null ? map['weight']['value']?.toDouble() : null,
      media: (map['media'] as List<dynamic>).isNotEmpty
          ? List<Map<String, dynamic>>.from(map['media'])
              .map((e) => e['url'] as String)
              .toList()
          : [],
      onSale: map['pricing']['onSale'] ?? false,
      currency: map['pricing']['price']['gross']['currency'] ?? '',
      discount: map['pricing']['discount'] != null
          ? map['pricing']['discount']['gross']['amount'].toDouble()
          : null,
      price: map['pricing']['price']['gross']['amount'].toDouble(),
      priceUndiscounted:
          map['pricing']['priceUndiscounted']['gross']['amount'].toDouble(),
      values: valuesList,
      attributes: (map['attributes'] as List<dynamic>).isNotEmpty
          ? (map['attributes'] as List<dynamic>)
              .map((e) => AttributeModel.fromMap(e['attribute']))
              .toList()
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductVariantModel.fromJson(String source) =>
      ProductVariantModel.fromStoredMap(json.decode(source));
}
