import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_products_usecase.dart';

import 'get_products_test.mocks.dart';

@GenerateMocks([StorefrontRepository])
void main() {
  late GetProductsUseCase usecase;
  late MockStorefrontRepository mockStorefrontRepository;
  late String tChannel;
  late int tNumber;
  late List<Product> tProducts;

  setUp(() {
    mockStorefrontRepository = MockStorefrontRepository();
    usecase = GetProductsUseCase(mockStorefrontRepository);
    tChannel = "default-channel";
    tNumber = 1;
    tProducts = [
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
    ];
  });

  test('should get products details from the repository', () async {
    //arrange
    when(mockStorefrontRepository.getProducts(
            number: tNumber, channel: tChannel))
        .thenAnswer((_) async => Right(tProducts));
    //act
    final result =
        await usecase(ProductsPrams(number: tNumber, channel: tChannel));
    //assert
    expect(result, equals(Right(tProducts)));
    verify(mockStorefrontRepository.getProducts(
        number: tNumber, channel: tChannel));
    verifyNoMoreInteractions(mockStorefrontRepository);
  });
}
