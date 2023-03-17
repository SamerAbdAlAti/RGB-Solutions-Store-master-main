import 'package:flutter/foundation.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/attribute.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/attribute_value.dart';

class ProductVariant {
  String id;
  String name;
  int quantityAvailable;
  int? quantityLimitPerCustomer;
  String? unit;
  double? weight;
  List<String> media;
  List<Attribute> attributes;
  List<AttributeValue> values;
  bool onSale;
  String currency;
  double? discount;
  double price;
  double priceUndiscounted;
  ProductVariant({
    required this.id,
    required this.name,
    required this.quantityAvailable,
    this.quantityLimitPerCustomer,
    this.unit,
    this.weight,
    required this.media,
    required this.attributes,
    required this.values,
    required this.onSale,
    required this.currency,
    this.discount,
    required this.price,
    required this.priceUndiscounted,
  });

  @override
  String toString() {
    return 'ProductVariant(id: $id, name: $name, quantityAvailable: $quantityAvailable, quantityLimitPerCustomer: $quantityLimitPerCustomer, unit: $unit, weight: $weight, media: $media, attributes: $attributes, values: $values, onSale: $onSale, currency: $currency, discount: $discount, price: $price, priceUndiscounted: $priceUndiscounted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductVariant &&
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
}
