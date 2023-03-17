import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_category_usecase.dart';

import 'get_single_category.mocks.dart';

@GenerateMocks([StorefrontRepository])
void main() {
  late MockStorefrontRepository repository;
  late GetSingleCategoryUseCase useCase;
  late String tId;
  late String tChannel;
  late int tAmountOfProducts;
  late Category tCategory;

  setUp(() {
    repository = MockStorefrontRepository();
    useCase = GetSingleCategoryUseCase(repository);
    tId = "Q2F0ZWdvcnk6MjU=";
    tChannel = "default-channel";
    tAmountOfProducts = 1;
    tCategory =
        Category(id: "Q2F0ZWdvcnk6MjU=", name: "Accessories", products: [
      Product(
          id: "UHJvZHVjdDoxNTI=",
          name: "Apple Juice",
          unit: "KG",
                weight: 0.800,
          description:
              "{\"time\": 1653425438149, \"blocks\": [{\"id\": \"rGR983yNVl\", \"data\": {\"text\": \"<b>Fell straight from the tree</b>, on to Newton\\u2019s head, then into the bottle. The autumn taste of English apples. Brought to you by gravity.\"}, \"type\": \"paragraph\"}], \"version\": \"2.22.2\"}",
          thumbnail:
              "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/saleor-apple-drink_thumbnail_256.png",
          category: Category(
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
  });

  test('should get a single category details from the repository', () async {
    // Arrange
    when(repository.getSingleCategory(
            id: tId, channel: tChannel, amountOfProducts: tAmountOfProducts))
        .thenAnswer((_) async => Right(tCategory));
    // Act
    final result = await useCase(CategoryParams(
        id: tId, channel: tChannel, amountOfProducts: tAmountOfProducts));
    // Assert
    expect(result, equals(Right(tCategory)));
    verify(repository.getSingleCategory(
        id: tId, channel: tChannel, amountOfProducts: tAmountOfProducts));
    verifyNoMoreInteractions(repository);
  });
}
