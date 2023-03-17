// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_cast
import 'dart:convert';

import 'package:flutter/foundation.dart' hide Category;
import 'package:saleor_app_flutter/features/storefront/data/models/attribute_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/attribute_value.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/category_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/page_info_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_variant_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.id,
      required super.name,
      super.description,
      super.rating,
      super.unit,
      super.weight,
      required super.thumbnail,
      required super.currency,
      required super.defaultVariant,
      required super.variants,
      required super.category,
      required super.amount,
      required super.undiscountedAmount,
      required super.media,
      super.pageInfo,
      required super.isAvailable,
      required super.attributes,
      required super.values, required super.notes,
      /*
      required int quantityAvailable, required quantityLimit
       */
      });

  factory ProductModel.fromEntity(Product product) => ProductModel(
        id: product.id,
        name: product.name,
        description: product.description,
        thumbnail: product.thumbnail,
        media: product.media,
        category: product.category,
        isAvailable: product.isAvailable,
        defaultVariant: product.defaultVariant,
        unit: product.unit,
        weight: product.weight,
        amount: product.amount,
        undiscountedAmount: product.undiscountedAmount,
        currency: product.currency,
        pageInfo: product.pageInfo,
        variants: product.variants,
        attributes: product.attributes,
        values: product.values, notes: product.notes,
        // quantityAvailable: product.quantityAvailable!,
        // quantityLimit: product.quantityLimit,
      );

  factory ProductModel.fromMap(
      Map<String, dynamic> jsonMap, PageInfoModel? pageInfoModel) {
    List<AttributeValueModel> valuesList = [];

    if ((jsonMap['attributes'] as List<dynamic>).isNotEmpty) {
      for (var element in (jsonMap['attributes'] as List<dynamic>)) {
        for (var element2 in (element['values'] as List<dynamic>)) {
          valuesList.add(AttributeValueModel.fromMap(element2));
        }
      }
    }
    List<String> mediaUrls = [];
    String desc = jsonMap['description'] != null
        ? json
            .decode(jsonMap['description'])['blocks'][0]['data']['text']
            .replaceAll('<b>', '*')
            .replaceAll('</b>', '*')
        : "";
    for (var map in jsonMap['media']) {
      mediaUrls.add(map['url']);
    }
    return ProductModel(
        id: jsonMap['id'],
        name: jsonMap['name'],
        description: desc,
        unit: jsonMap['weight'] != null
            ? jsonMap['weight']['unit'] as String
            : null,
        weight: jsonMap['weight'] != null
            ? jsonMap['weight']['value'] as double
            : null,
        isAvailable: jsonMap['isAvailable'] as bool,
        rating: jsonMap['rating'],
        thumbnail:
            jsonMap['thumbnail'] != null ? jsonMap['thumbnail']['url'] : '',
        amount: jsonMap['pricing']['priceRange']['start']['gross']['amount']
            .toString(),
        undiscountedAmount: jsonMap['pricing']['priceRangeUndiscounted']
                ['start']['gross']['amount']
            .toString(),
        category: CategoryModel.fromMap(jsonMap['category'], null),
        defaultVariant: ProductVariantModel.fromMap(jsonMap['defaultVariant']),
        currency: jsonMap['pricing']['priceRange']['start']['gross']
            ['currency'],
        media: mediaUrls,
        pageInfo: pageInfoModel,
        variants: (jsonMap['variants'] as List<dynamic>).isNotEmpty
            ? (jsonMap['variants'] as List<dynamic>)
                .map((e) => ProductVariantModel.fromMap(e))
                .toList()
            : [],
        attributes: (jsonMap['attributes'] as List<dynamic>).isNotEmpty
            ? (jsonMap['attributes'] as List<dynamic>)
                .map((e) => AttributeModel.fromMap(e['attribute']))
                .toList()
            : [],
        values: valuesList, notes: '');
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnail,
      'currency': currency,
      'category': (category as CategoryModel).toMap(),
      'isAvailable': isAvailable,
      'defaultVariant': (defaultVariant as ProductVariantModel).toMap(),
      'variants': (variants as List<dynamic>).map((x) => x.toMap()).toList(),
      'attributes':
          (attributes as List<dynamic>).map((x) => x.toMap()).toList(),
      'values': (values as List<dynamic>).map((x) => x.toMap()).toList(),
      'rating': rating,
      'unit': unit,
      'weight': weight,
      'amount': amount,
      'undiscountedAmount': undiscountedAmount,
      'media': media,
      'pageInfo': (pageInfo as PageInfoModel?)?.toMap(),
    };
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, thumbnail: $thumbnail, currency: $currency, category: $category, isAvailable: $isAvailable, rating: $rating, unit: $unit, weight: $weight, amount: $amount, undiscountedAmount: $undiscountedAmount, media: $media, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
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
        // other.notes = notes;
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

  factory ProductModel.fromStoredMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      thumbnail: map['thumbnail'],
      currency: map['currency'],
      category: CategoryModel.fromStoredMap(map['category']),
      isAvailable: map['isAvailable'],
      defaultVariant: ProductVariantModel.fromStoredMap(map['defaultVariant']),
      rating: map['rating'],
      unit: map['unit'],
      weight: map['weight'],
      amount: map['amount'] as String,
      undiscountedAmount: map['undiscountedAmount'] as String,
      media: List<String>.from((map['media'] as List<dynamic>)),
      variants: List<ProductVariantModel>.from(
          map['variants']?.map((x) => ProductVariantModel.fromStoredMap(x))),
      attributes: List<AttributeModel>.from(
          map['attributes']?.map((x) => AttributeModel.fromStoredMap(x))),
      values: List<AttributeValueModel>.from(
          map['values']?.map((x) => AttributeValueModel.fromStoredMap(x))),
      pageInfo: map['pageInfo'] != null
          ? PageInfoModel.fromStoredMap(map['pageInfo'] as Map<String, dynamic>)
          : null, notes: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromStoredMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductModelX on ProductModel {
  Product toEntity() => Product(
      id: id,
      name: name,
      description: description,
      rating: rating,
      thumbnail: thumbnail,
      amount: amount,
      unit: unit,
      defaultVariant: defaultVariant,
      variants: variants,
      isAvailable: isAvailable,
      weight: weight,
      undiscountedAmount: undiscountedAmount,
      category: category,
      currency: currency,
      media: media,
      pageInfo: pageInfo,
      attributes: attributes,
      values: values, notes: notes);
}
