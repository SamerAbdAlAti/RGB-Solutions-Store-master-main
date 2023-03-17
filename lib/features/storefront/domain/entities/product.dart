// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart' hide Category;
import 'package:saleor_app_flutter/features/storefront/domain/entities/attribute.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/attribute_value.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product_variant.dart';

class Product {
  String id;
  String name;
  String? description;
  String thumbnail;
  String currency;
  String notes; // هذه اتذكرها عشان بدي أخزن فيها قيمة الملاحظات اللي انا دخلتها واللي حتترفع علسيرفر
  Category category;
  bool isAvailable;
  ProductVariant defaultVariant;
  List<ProductVariant> variants;
  List<Attribute> attributes;
  List<AttributeValue> values;
  double? rating;
  String? unit;
  double? weight;
  String amount;
  String undiscountedAmount;
  List<String> media;
  PageInfo? pageInfo;
  // I add it
  // int? quantityAvailable;
  // int? quantityLimit;
  Product({
    required this.id,
    required this.name,
    this.description,
    required this.thumbnail,
    required this.currency,
    required this.category,
    required this.isAvailable,
    this.rating,
    required this.defaultVariant,
    required this.variants,
    required this.attributes,
    required this.values,
    this.unit,
    this.weight,
    required this.amount,
    required this.undiscountedAmount,
    required this.media,
    required this.pageInfo,
    required this.notes
    // I add it
    // this.quantityAvailable,
    // this.quantityLimit
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.thumbnail == thumbnail &&
        other.currency == currency &&
        other.category == category &&
        other.isAvailable == isAvailable &&
        other.defaultVariant == defaultVariant &&
        other.variants == variants &&
        other.attributes == attributes &&
        other.values == values &&
        other.rating == rating &&
        other.unit == unit &&
        other.weight == weight &&
        other.amount == amount &&
        other.undiscountedAmount == undiscountedAmount &&
        listEquals(other.media, media) &&
        other.pageInfo == pageInfo;
  }

  bool get isDiscounted => amount == undiscountedAmount ? false : true;

  String get discountPercentage {
    double discounted = defaultVariant.discount ?? 0;
    double undiscounted = defaultVariant.priceUndiscounted;
    return "${((discounted / undiscounted) * 100).round()}%";
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        thumbnail.hashCode ^
        currency.hashCode ^
        category.hashCode ^
        isAvailable.hashCode ^
        rating.hashCode ^
        defaultVariant.hashCode ^
        attributes.hashCode ^
        values.hashCode ^
        unit.hashCode ^
        weight.hashCode ^
        amount.hashCode ^
        undiscountedAmount.hashCode ^
        media.hashCode ^
        pageInfo.hashCode;
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, thumbnail: $thumbnail, currency: $currency, category: $category, isAvailable: $isAvailable, rating: $rating, unit: $unit, weight: $weight, amount: $amount, undiscountedAmount: $undiscountedAmount, media: $media, pageInfo: $pageInfo)';
  }
}
