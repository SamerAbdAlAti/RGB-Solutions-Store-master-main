import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_categories_usecase.dart';

import 'get_categories_test.mocks.dart';

@GenerateMocks([StorefrontRepository])
void main() {
  late GetCategoriesUseCase useCase;
  late MockStorefrontRepository repository;
  late int tAmount;
  late String tChannel;
  late int tAmountOfProducts;
  late List<Category> tCategories;

  setUp(() {
    repository = MockStorefrontRepository();
    useCase = GetCategoriesUseCase(repository);
    tAmount = 2;
    tChannel = 'default-channel';
    tAmountOfProducts = 1;
    tCategories = [
      Category(
          id: "Q2F0ZWdvcnk6MQ==",
          name: "Default Category",
          products: null,
          pageInfo: PageInfo(
              totalCount: 17,
              hasNextPage: true,
              hasPreviousPage: false,
              startCursor: "WyIxIl0=",
              endCursor: "WyIyNSJd")),
      Category(
          id: "Q2F0ZWdvcnk6MjU=",
          name: "Accessories",
          pageInfo: PageInfo(
              totalCount: 17,
              hasNextPage: true,
              hasPreviousPage: false,
              startCursor: "WyIxIl0=",
              endCursor: "WyIyNSJd"),
          products: [
            Product(
                id: "UHJvZHVjdDoxNDU=",
                name: "Battle-tested at brands like Lush",
                unit: "KG",
                weight: 0.800,
                description:
                    "{\"time\": 1652811542659, \"blocks\": [{\"id\": \"g2sLxZcLZa\", \"data\": {\"text\": \"Scale <b>effortlessly</b>\"}, \"type\": \"paragraph\"}], \"version\": \"2.22.2\"}",
                thumbnail: "https://demo.saleor.io/media/thumbnails/products/saleor-battle-tested-book_thumbnail_256.png",
                category: Category(id: "Q2F0ZWdvcnk6MjY=", name: "Audiobooks"),
                pageInfo: null,
                quantityAvailable: 50,
                undiscountedAmount: "10",
                quantityLimit: null,
                currency: "USD",
                amount: "10",
                media: [
                  "https://demo.saleor.io/media/products/saleor-battle-tested-book.png"
                ])
          ])
    ];
  });
  test('should get categories details from the repository', () async {
    //arrange
    when(repository.getCategories(amount: tAmount,
        channel: tChannel,
        amountOfProducts: tAmountOfProducts))
        .thenAnswer((_) async => Right(tCategories));
    //act
    final result = await useCase(CategoriesPrams(
        amount: tAmount,
        channel: tChannel,
        amountOfProducts: tAmountOfProducts));
    //assert
    expect(result, equals(Right(tCategories)));
    verify(repository.getCategories(amount: tAmount,
        channel: tChannel,
        amountOfProducts: tAmountOfProducts));
    verifyNoMoreInteractions(repository);
  });
}
