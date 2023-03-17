import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/category_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/page_info_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late List<Category> tCategoriesModel;
  late Category tCategoryModel;

  setUp(
    () {
      tCategoryModel = CategoryModel(
          id: "Q2F0ZWdvcnk6MjU=",
          backgroundImage: null,
          desciption: null,
          name: "Accessories",
          pageInfo: PageInfoModel(
              totalCount: 10,
              hasNextPage: true,
              hasPreviousPage: false,
              startCursor:
                  "WyJiYXR0bGUtdGVzdGVkLWF0LWJyYW5kcy1saWtlLWx1c2giXQ==",
              endCursor:
                  "WyJiYXR0bGUtdGVzdGVkLWF0LWJyYW5kcy1saWtlLWx1c2giXQ=="),
          products: [
            ProductModel(
                id: "UHJvZHVjdDoxNDU=",
                name: "Battle-tested at brands like Lush",
                description: "Scale <b>effortlessly</b>",
                unit: "KG",
                weight: 0.8,
                thumbnail:
                    "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/saleor-battle-tested-book_thumbnail_256.png",
                currency: "USD",
                amount: "10",
                category: CategoryModel(
                    id: "Q2F0ZWdvcnk6MjY=",
                    name: "Audiobooks",
                    desciption: null,
                    backgroundImage: null),
                quantityAvailable: 50,
                quantityLimit: null,
                undiscountedAmount: "10",
                pageInfo: null,
                media: [
                  "https://alhowaridates.eu.saleor.cloud/media/products/saleor-battle-tested-book.png"
                ])
          ]);
      tCategoriesModel = [
        CategoryModel(
            id: "Q2F0ZWdvcnk6MjU=",
            backgroundImage: null,
            desciption: null,
            name: "Accessories",
            pageInfo: PageInfoModel(
                totalCount: 17,
                hasNextPage: true,
                hasPreviousPage: false,
                startCursor: "WyIxIl0=",
                endCursor: "WyIyNSJd"),
            products: [
              ProductModel(
                  id: "UHJvZHVjdDoxNDU=",
                  name: "Battle-tested at brands like Lush",
                  description: "Scale <b>effortlessly</b>",
                  unit: "KG",
                  weight: 0.8,
                  thumbnail:
                      "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/saleor-battle-tested-book_thumbnail_256.png",
                  currency: "USD",
                  amount: "10",
                  category: CategoryModel(
                      id: "Q2F0ZWdvcnk6MjY=",
                      name: "Audiobooks",
                      desciption: null,
                      backgroundImage: null),
                  quantityAvailable: 50,
                  quantityLimit: null,
                  undiscountedAmount: "10",
                  pageInfo: null,
                  media: [
                    "https://alhowaridates.eu.saleor.cloud/media/products/saleor-battle-tested-book.png"
                  ])
            ])
      ];
    },
  );

  group('fromJson', () {
    test('should return a vaild list of categories from a json string', () {
      // Arrange
      final Map<String, dynamic> jsonString =
          jsonDecode(fixture('categories.json'));
      // Act
      final pageInfoModel = PageInfoModel.fromMap(jsonString['categories']);
      final result = jsonString['categories']['edges']
          .map((e) => CategoryModel.fromMap(e['node'], pageInfoModel))
          .cast<CategoryModel>()
          .toList();
      // Assert
      expect(result, tCategoriesModel);
    });

    test('should return a single category from a json string', () {
      // Arrange
      final Map<String, dynamic> jsonString =
          jsonDecode(fixture('single_category.json'));
      // Act
      final pageInfo =
          PageInfoModel.fromMap(jsonString['category']['products']);
      final result = CategoryModel.fromMap(jsonString['category'], pageInfo);
      // Assert
      expect(result, tCategoryModel);
    });
  });
}
