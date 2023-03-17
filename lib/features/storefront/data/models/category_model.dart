// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart' hide Category;
import 'package:saleor_app_flutter/features/storefront/data/models/page_info_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';

import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required super.id,
      required super.name,
      required super.desciption,
      required super.backgroundImage,
      super.childern,
      super.products,
      super.pageInfo});

  factory CategoryModel.fromMap(
      Map<String, dynamic> map, PageInfoModel? pageInfoModel) {
    bool containeProducts = false;
    bool containeChildren = false;
    if (map.containsKey('products')) {
      containeProducts = true;

      if (map['products']['edges'].isEmpty) containeProducts = false;
    }
    if (map.containsKey('children')) {
      containeChildren = true;

      if (map['children']['edges'].isEmpty) containeChildren = false;
    }
    return CategoryModel(
        id: map['id'] as String,
        name: map['name'] as String,
        desciption:
            map['desciption'] != null ? map['desciption'] as String : null,
        backgroundImage: map['backgroundImage'] != null
            ? map['backgroundImage']['url'] as String
            : null,
        products: containeProducts
            ? List<ProductModel>.from(
                (map['products']['edges'] as List<dynamic>).map<ProductModel>(
                  (x) => ProductModel.fromMap(
                      x['node'] as Map<String, dynamic>, null),
                ),
              )
            : null,
        childern: containeChildren
            ? List<Category>.from(
                (map['children']['edges'] as List<dynamic>).map<CategoryModel>(
                  (x) => CategoryModel.fromMap(
                      x['node'] as Map<String, dynamic>, null),
                ),
              )
            : null,
        pageInfo: pageInfoModel);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desciption': desciption,
      'backgroundImage': backgroundImage,
      'products':
          (products as List<ProductModel>?)?.map((x) => x.toMap()).toList(),
      'childern':
          (childern as List<CategoryModel>?)?.map((x) => x.toMap()).toList(),
      'pageInfo': (pageInfo as PageInfoModel?)?.toMap(),
    };
  }

  @override
  bool operator ==(covariant CategoryModel other) {
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
  String toString() =>
      "CategoryModel(id:$id, name:$name, desciption:$desciption, backgroundImage:$backgroundImage, products:${products?.toString() ?? 'null'})})";

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

  factory CategoryModel.fromStoredMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      desciption:
          map['desciption'] != null ? map['desciption'] as String : null,
      backgroundImage: map['backgroundImage'] != null
          ? map['backgroundImage'] as String
          : null,
      products: map['products'] != null
          ? List<ProductModel>.from(
              (map['products'] as List<dynamic>).map<ProductModel?>(
                (x) => ProductModel.fromStoredMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      childern: map['childern'] != null
          ? List<CategoryModel>.from(
              (map['childern'] as List<dynamic>).map<CategoryModel?>((x) =>
                  CategoryModel.fromStoredMap(x as Map<String, dynamic>)),
            )
          : null,
      pageInfo: map['pageInfo'] != null
          ? PageInfoModel.fromStoredMap(map['pageInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromStoredMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryModelX on CategoryModel {
  Category toEntity() {
    return Category(
        id: id,
        name: name,
        products: products,
        backgroundImage: backgroundImage,
        desciption: desciption,
        pageInfo: pageInfo);
  }
}
