import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/category_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/page_info_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  ProductModel tProduct = ProductModel(
    id: "UHJvZHVjdDoxNTI=",
    name: "Apple Juice",
    unit: "KG",
    weight: 0.8,
    description:
        "<b>Fell straight from the tree</b>, on to Newton’s head, then into the bottle. The autumn taste of English apples. Brought to you by gravity.",
    thumbnail:
        "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/saleor-apple-drink_thumbnail_256.png",
    category: CategoryModel(
        id: "Q2F0ZWdvcnk6NDM=",
        name: "Juices",
        desciption: null,
        backgroundImage: null),
    quantityAvailable: 50,
    quantityLimit: null,
    undiscountedAmount: "1.99",
    amount: "1.6",
    currency: "USD",
    media: [
      "https://alhowaridates.eu.saleor.cloud/media/products/saleor-apple-drink.png",
    ],
  );
  List<ProductModel> tProducts = [
    ProductModel(
        id: "UHJvZHVjdDoxNTI=",
        name: "Apple Juice",
        unit: "KG",
        weight: 0.8,
        description:
            "<b>Fell straight from the tree</b>, on to Newton’s head, then into the bottle. The autumn taste of English apples. Brought to you by gravity.",
        thumbnail:
            "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/saleor-apple-drink_thumbnail_256.png",
        category: CategoryModel(
            id: "Q2F0ZWdvcnk6NDM=",
            name: "Juices",
            desciption: null,
            backgroundImage: null),
        quantityAvailable: 50,
        quantityLimit: null,
        undiscountedAmount: "1.99",
        amount: "1.6",
        currency: "USD",
        media: [
          "https://alhowaridates.eu.saleor.cloud/media/products/saleor-apple-drink.png",
        ],
        pageInfo: PageInfoModel(
            totalCount: 32,
            hasNextPage: true,
            hasPreviousPage: false,
            startCursor: "WyJhcHBsZS1qdWljZSJd",
            endCursor: "WyJhcHBsZS1qdWljZSJd"))
  ];
  group('fromJson', () {
    test('should return a valid model from json', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('single_product.json'));
      //act
      final result = ProductModel.fromMap(jsonMap['product'], null);
      //assert
      expect(result, tProduct);
    });
    test('should a list of product models from json', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('products.json'));
      //act
      final pageInfoMode = PageInfoModel.fromMap(jsonMap['products']);
      final result = jsonMap['products']['edges']
          .map((e) => ProductModel.fromMap(e['node'], pageInfoMode))
          .cast<ProductModel>()
          .toList();
      //assert
      expect(result, tProducts);
    });
  });
}
