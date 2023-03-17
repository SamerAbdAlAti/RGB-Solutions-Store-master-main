// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/collection.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';

class CollectionModel extends Collection {
  CollectionModel(
      {required super.id,
      required super.name,
      super.description,
      super.metafield,
      super.backgroundImage,
      super.translatedDescription,
      super.translatedName,
      super.products,
      super.pageInfo});

  CollectionModel copyWith({
    String? id,
    String? name,
    String? description,
    String? metafield,
    String? backgroundImage,
    String? translatedName,
    String? translatedDescription,
    List<Product>? products,
    PageInfo? pageInfo,
  }) {
    return CollectionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      metafield: metafield ?? this.metafield,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      translatedName: translatedName ?? this.translatedName,
      translatedDescription:
          translatedDescription ?? this.translatedDescription,
      products: products ?? this.products,
      pageInfo: pageInfo ?? this.pageInfo,
    );
  }

  factory CollectionModel.fromMap(
      Map<String, dynamic> map, PageInfo? pageInfo) {
    bool containeProducts = false;
    if (map.containsKey('products')) {
      containeProducts = true;

      if (map['products']['edges'].isEmpty) containeProducts = false;
    }
    return CollectionModel(
      id: map['id'] as String,
      name: map['name'] as String,
      metafield: map['metafield'] != null ? map['metafield'] as String : null,
      backgroundImage: map['backgroundImage'] != null
          ? map['backgroundImage']['url'] as String
          : null,
      translatedName: map['translation'] != null
          ? map['translation']['name'] as String
          : null,
      translatedDescription: map['translation'] != null
          ? map['translation']['description'] as String
          : null,
      products: containeProducts
          ? List<ProductModel>.from(
              (map['products']['edges'] as List<dynamic>).map<ProductModel>(
                (x) => ProductModel.fromMap(
                    x['node'] as Map<String, dynamic>, null),
              ),
            )
          : null,
      pageInfo: pageInfo,
    );
  }

  @override
  String toString() {
    return 'CollectionModel(id: $id, name: $name, metafield: $metafield, backgroundImage: $backgroundImage, translatedName: $translatedName, translatedDescription: $translatedDescription, products: $products, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(covariant CollectionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.metafield == metafield &&
        other.backgroundImage == backgroundImage &&
        other.translatedName == translatedName &&
        other.translatedDescription == translatedDescription &&
        listEquals(other.products, products) &&
        other.pageInfo == pageInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        metafield.hashCode ^
        backgroundImage.hashCode ^
        translatedName.hashCode ^
        translatedDescription.hashCode ^
        products.hashCode ^
        pageInfo.hashCode;
  }
}
