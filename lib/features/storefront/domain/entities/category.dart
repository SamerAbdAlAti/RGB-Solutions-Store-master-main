// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';

class Category {
  String id;
  String name;
  String? desciption;
  String? backgroundImage;
  List<Product>? products;
  List<Category>? childern;
  PageInfo? pageInfo;
  Category(
      {required this.id,
      required this.name,
      this.desciption,
      this.backgroundImage,
      this.products,
      this.childern,
      this.pageInfo});

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desciption == desciption &&
        other.backgroundImage == backgroundImage &&
        listEquals(other.products, products) &&
        listEquals(other.childern, childern) &&
        other.pageInfo == pageInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desciption.hashCode ^
        backgroundImage.hashCode ^
        products.hashCode ^
        childern.hashCode ^
        pageInfo.hashCode;
  }
}
