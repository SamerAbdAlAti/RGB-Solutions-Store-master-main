// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';

class Collection {
  String id;
  String name;
  String? description;
  String? metafield;
  String? backgroundImage;
  String? translatedName;
  String? translatedDescription;
  List<Product>? products;
  PageInfo? pageInfo;
  Collection({
    required this.id,
    required this.name,
    this.description,
    this.metafield,
    this.backgroundImage,
    this.translatedName,
    this.translatedDescription,
    this.products,
    this.pageInfo,
  });

  @override
  String toString() {
    return 'Collection(id: $id, name: $name, metafield: $metafield, backgroundImage: $backgroundImage, translatedName: $translatedName, translatedDescription: $translatedDescription, products: $products, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(covariant Collection other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description ==  description&&
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
        description.hashCode^
        metafield.hashCode ^
        backgroundImage.hashCode ^
        translatedName.hashCode ^
        translatedDescription.hashCode ^
        products.hashCode ^
        pageInfo.hashCode;
  }
}
