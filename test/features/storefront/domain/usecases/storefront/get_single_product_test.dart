import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/get_single_product_usecase.dart';

import 'get_single_product_test.mocks.dart';

@GenerateMocks([StorefrontRepository])
void main() {
  late GetSingleProductUseCase usecase;
  late MockStorefrontRepository repository;
  late String tId;
  late String tChannel;
  late Product tProduct;

  setUp(
    () {
      repository = MockStorefrontRepository();
      usecase = GetSingleProductUseCase(repository);
      tId = "UHJvZHVjdDoxNTI=";
      tChannel = "default-channel";
      tProduct = Product(
          id: "UHJvZHVjdDoxNTI=",
          name: "Apple Juice",
          unit: "KG",
                weight: 0.8,
          description:
              "{\"time\": 1653425438149, \"blocks\": [{\"id\": \"rGR983yNVl\", \"data\": {\"text\": \"<b>Fell straight from the tree</b>, on to Newton\\u2019s head, then into the bottle. The autumn taste of English apples. Brought to you by gravity.\"}, \"type\": \"paragraph\"}], \"version\": \"2.22.2\"}",
          thumbnail:
              "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/saleor-apple-drink_thumbnail_256.png",
          category: Category(
              id: "Q2F0ZWdvcnk6NDM=",
              name: "Juices",
              desciption: null,
              backgroundImage: null),
          // quantityAvailable: 50,
          // quantityLimit: null,
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
              endCursor: "WyJhcHBsZS1qdWljZSJd"), isAvailable: null, defaultVariant: null, variants: [], attributes: [], values: []);
    },
  );

  test('should get a single product', () async {
    //arrange
    when(repository.getSingleProduct(tId, tChannel))
        .thenAnswer((realInvocation) async => Right(tProduct));
    //act
    final result = await usecase(SingleProductPrams(tId, tChannel));
    //assert
    expect(result, Right(tProduct));
    verify(repository.getSingleProduct(tId, tChannel));
    verifyNoMoreInteractions(repository);
  });
}
