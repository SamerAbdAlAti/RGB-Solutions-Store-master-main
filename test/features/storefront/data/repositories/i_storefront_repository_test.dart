import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/network/network_info.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/storefront_remote_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/category_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/page_info_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/repositories/i_storefront_repository.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';

import 'i_storefront_repository_test.mocks.dart';

@GenerateMocks([IStorefrontRepository, StorefrontRemoteDatasource, NetworkInfo])
void main() {
  late IStorefrontRepository repository;
  late MockStorefrontRemoteDatasource mockRemoteDatasource;
  late MockNetworkInfo mockNetworkInfo;
  late String tChannel;
  late int tNumber;
  late String tId;
  late List<ProductModel> tProductsModel;
  List<Product> tProducts = [];
  late ProductModel tSingleProductModel;
  late Product tSingleProduct;

  late String tCategoryId;
  late int tAmountOfProducts;
  late Category tCategory;
  late CategoryModel tCategoryModel;
  List<Category> tCategories = [];
  List<CategoryModel> tCategoriesModel = [];

  setUp(() {
    mockRemoteDatasource = MockStorefrontRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    repository = IStorefrontRepository(
      remoteDataSource: mockRemoteDatasource,
      networkInfo: mockNetworkInfo,
    );
    tChannel = "default-channel";
    tNumber = 1;
    tId = "UHJvZHVjdDoxNTI=";
    tSingleProductModel = ProductModel(
      id: "UHJvZHVjdDoxNTI=",
      name: "Apple Juice",
      unit: "KG",
      weight: 0.8,
      description:
          "{\"time\": 1653425438149, \"blocks\": [{\"id\": \"rGR983yNVl\", \"data\": {\"text\": \"<b>Fell straight from the tree</b>, on to Newton\\u2019s head, then into the bottle. The autumn taste of English apples. Brought to you by gravity.\"}, \"type\": \"paragraph\"}], \"version\": \"2.22.2\"}",
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
    tAmountOfProducts = 1;
    tCategoryId = "Q2F0ZWdvcnk6MjU=";
    tCategoryModel = CategoryModel(
        id: "Q2F0ZWdvcnk6MjU=",
        name: "Accessories",
        desciption: null,
        backgroundImage: null,
        products: [
          ProductModel(
              id: "UHJvZHVjdDoxNTI=",
              name: "Apple Juice",
              unit: "KG",
              weight: 0.8,
              description:
                  "{\"time\": 1653425438149, \"blocks\": [{\"id\": \"rGR983yNVl\", \"data\": {\"text\": \"<b>Fell straight from the tree</b>, on to Newton\\u2019s head, then into the bottle. The autumn taste of English apples. Brought to you by gravity.\"}, \"type\": \"paragraph\"}], \"version\": \"2.22.2\"}",
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
              pageInfo: PageInfo(
                  totalCount: 32,
                  hasNextPage: true,
                  hasPreviousPage: false,
                  startCursor: "WyJhcHBsZS1qdWljZSJd",
                  endCursor: "WyJhcHBsZS1qdWljZSJd"))
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
                unit: "KG",
                weight: 0.8,
                name: "Battle-tested at brands like Lush",
                description:
                    "{\"time\": 1652811542659, \"blocks\": [{\"id\": \"g2sLxZcLZa\", \"data\": {\"text\": \"Scale <b>effortlessly</b>\"}, \"type\": \"paragraph\"}], \"version\": \"2.22.2\"}",
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
    tCategories = tCategoriesModel;
    tCategory = tCategoryModel;
    tProductsModel = [
      ProductModel(
        id: "UHJvZHVjdDoxNTI=",
        name: "Apple Juice",
        unit: "KG",
        weight: 0.8,
        description:
            "{\"time\": 1653425438149, \"blocks\": [{\"id\": \"rGR983yNVl\", \"data\": {\"text\": \"<b>Fell straight from the tree</b>, on to Newton\\u2019s head, then into the bottle. The autumn taste of English apples. Brought to you by gravity.\"}, \"type\": \"paragraph\"}], \"version\": \"2.22.2\"}",
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
      )
    ];
    tProducts = tProductsModel;
    tSingleProduct = tSingleProductModel;
  });

  group("device is online", () {
    setUp(
      () {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      },
    );

    group("getProducts", () {
      test(
          'should return remote data when the call to remote data source is success',
          () async {
        //arrange
        when(mockRemoteDatasource.getProducts(
                number: tNumber, channel: tChannel))
            .thenAnswer((_) async => tProductsModel);
        //act
        final result =
            await repository.getProducts(number: tNumber, channel: tChannel);
        //assert
        verify(mockRemoteDatasource.getProducts(
            number: tNumber, channel: tChannel));
        expect(result, equals(Right(tProducts)));
      });
      test(
          'should throw ServerExcepton when the call to remote data source is unsuccessful',
          () async {
        //arrange
        when(mockRemoteDatasource.getProducts(
                number: tNumber, channel: tChannel))
            .thenThrow(ServerException());
        //act
        final result =
            await repository.getProducts(number: tNumber, channel: tChannel);
        //assert
        verify(mockRemoteDatasource.getProducts(
            number: tNumber, channel: tChannel));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group("getSingleProduct", () {
      test(
          'should return remote data when the call to remote data source is success',
          () async {
        //arrange
        when(mockRemoteDatasource.getSingleProduct(tId, tChannel))
            .thenAnswer((_) async => tSingleProductModel);
        //act
        final result = await repository.getSingleProduct(tId, tChannel);
        //assert
        verify(mockRemoteDatasource.getSingleProduct(tId, tChannel));
        expect(result, equals(Right(tSingleProduct)));
      });
      test(
          'should throw ServerExcepton when the call to remote data source is unsuccessful',
          () async {
        //arrange
        when(mockRemoteDatasource.getSingleProduct(tId, tChannel))
            .thenThrow(ServerException());
        //act
        final result = await repository.getSingleProduct(tId, tChannel);
        //assert
        verify(mockRemoteDatasource.getSingleProduct(tId, tChannel));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('getSingleCategory', () {
      test(
          'should return remote data when the call to remote data source is success',
          () async {
        // Arrange
        when(mockRemoteDatasource.getSingleCategory(
                id: tCategoryId,
                channel: tChannel,
                amountOfProducts: tAmountOfProducts))
            .thenAnswer((_) async => tCategoryModel);
        // Act
        final result = await repository.getSingleCategory(
            id: tCategoryId,
            channel: tChannel,
            amountOfProducts: tAmountOfProducts);
        // Assert
        verify(mockRemoteDatasource.getSingleCategory(
            id: tCategoryId,
            channel: tChannel,
            amountOfProducts: tAmountOfProducts));
        expect(result, equals(Right(tCategory)));
      });
      test(
          'should return [ServerException] when the call to remote data source is unsuccessful',
          () async {
        //arrange
        when(mockRemoteDatasource.getSingleCategory(
                id: tCategoryId,
                channel: tChannel,
                amountOfProducts: tAmountOfProducts))
            .thenThrow(ServerException());
        //act
        final result = await repository.getSingleCategory(
            id: tCategoryId,
            channel: tChannel,
            amountOfProducts: tAmountOfProducts);
        //assert
        verify(mockRemoteDatasource.getSingleCategory(
            id: tCategoryId,
            channel: tChannel,
            amountOfProducts: tAmountOfProducts));
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('getCategories', () {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // Arrange
        when(mockRemoteDatasource.getCategories(
                amount: tNumber,
                channel: tChannel,
                amountOfProducts: tAmountOfProducts))
            .thenAnswer((_) async => tCategoriesModel);
        // Act
        final result = await repository.getCategories(
            amount: tNumber,
            channel: tChannel,
            amountOfProducts: tAmountOfProducts);
        // Assert
        verify(mockRemoteDatasource.getCategories(
            amount: tNumber,
            channel: tChannel,
            amountOfProducts: tAmountOfProducts));
        expect(result, equals(Right(tCategories)));
      });

      test(
          'should return [ServerException] when the call to remote data source unsuccessful',
          () async {
        // Arrange
        when(mockRemoteDatasource.getCategories(
                amount: tNumber,
                channel: tChannel,
                amountOfProducts: tAmountOfProducts))
            .thenThrow(ServerException());
        // Act
        final result = await repository.getCategories(
            amount: tNumber,
            channel: tChannel,
            amountOfProducts: tAmountOfProducts);
        // Assert
        verify(mockRemoteDatasource.getCategories(
            amount: tNumber,
            channel: tChannel,
            amountOfProducts: tAmountOfProducts));
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });
}
