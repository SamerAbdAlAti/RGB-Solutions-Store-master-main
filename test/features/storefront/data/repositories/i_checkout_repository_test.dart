import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/local_auth_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_auth_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_checkout_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/category_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/repositories/i_checkout_repository.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/checkout_line.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/shipping_method.dart';

import 'i_checkout_repository_test.mocks.dart';

@GenerateMocks(
    [RemoteCheckoutDatasource, AuthLocalDatasource, AuthRemoteDatasource])
void main() {
  late Checkout tCheckout;
  late ICheckoutRepository checkoutRepository;
  late MockRemoteCheckoutDatasource checkoutDatasourceMock;
  late MockAuthLocalDatasource authLocalDatasourceMock;
  late MockAuthRemoteDatasource authRemoteDatasourceMock;
  setUp(() {
    authRemoteDatasourceMock = MockAuthRemoteDatasource();
    authLocalDatasourceMock = MockAuthLocalDatasource();
    checkoutDatasourceMock = MockRemoteCheckoutDatasource();
    checkoutRepository = ICheckoutRepository(checkoutDatasourceMock,
        authRemoteDatasourceMock, authLocalDatasourceMock);
    tCheckout = Checkout(
        id: "Q2hlY2tvdXQ6ZmU5MWY1N2ItY2NmNi00MmQzLWE2YzAtNDM4ZmU2MWY4MGJj",
        metafields: {},
        currency: "JOD",
        discountName: null,
        translatedDiscountName: null,
        voucherCode: null,
        quantity: 2,
        lines: [
          CheckoutLine(
              id:
                  "Q2hlY2tvdXRMaW5lOmNlOWZhMzRhLWEwYTItNGRjNS04NTgzLTcyNWRjY2QyMDQ2Zg==",
              quantity: 1,
              variantId: "UHJvZHVjdFZhcmlhbnQ6NDM3",
              variantName: "UHJvZHVjdFZhcmlhbnQ6NDM3",
              product: Product(
                  id: "UHJvZHVjdDoyMDA=",
                  name: " بهارات كباب شامي مهران 50غ",
                  description: " بهارات كباب شامي مهران 50غ",
                  thumbnail:
                      "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/Kebab_Shami_Mahran_Spices_50g_4a3058af_thumbnail_256.jpg",
                  currency: 'JOD',
                  category: CategoryModel(
                      id: "Q2F0ZWdvcnk6Njc=",
                      name: 'بهارات مهران',
                      desciption: null,
                      backgroundImage: null,
                      products: null),
                  isAvailable: true,
                  variantId: "UHJvZHVjdFZhcmlhbnQ6NDM3",
                  variantName: "UHJvZHVjdFZhcmlhbnQ6NDM3",
                  quantityAvailable: 50,
                  quantityLimit: null,
                  rating: 5,
                  unit: "KG",
                  weight: 0.05,
                  amount: "1.2",
                  undiscountedAmount: "1.2",
                  media: [
                    "https://alhowaridates.eu.saleor.cloud/media/products/Kebab_Shami_Mahran_Spices_50g_4a3058af.jpg"
                  ],
                  pageInfo: null),
              currency: "JOD",
              unitPrice: 1.2,
              undiscountedPrice: 1.2,
              totalPrice: 1.2),
          CheckoutLine(
              id:
                  "Q2hlY2tvdXRMaW5lOmJkNDRhODYwLWRiZmMtNDI1ZS1iYTk5LWFlZThhYTFlODUzYQ==",
              quantity: 1,
              variantId: "UHJvZHVjdFZhcmlhbnQ6NDQw",
              variantName: "UHJvZHVjdFZhcmlhbnQ6NDQw",
              product: Product(
                  id: "UHJvZHVjdDoyMDM=",
                  name: "الدار دبس أردني فاخر 800غ",
                  description: "الدار دبس أردني فاخر 800غ",
                  thumbnail:
                      "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/Al_Dar_Jordanian_Luxury_Molasses_800g_e7e935ac_thumbnail_256.png, currency: JOD, category: CategoryModel(id:Q2F0ZWdvcnk6NTI=, name:دبس, desciption:null, backgroundImage:https://alhowaridates.eu.saleor.cloud/media/category-backgrounds/10_01bee22d.jpg",
                  isAvailable: true,
                  variantId: "UHJvZHVjdFZhcmlhbnQ6NDQw",
                  variantName: "UHJvZHVjdFZhcmlhbnQ6NDQw",
                  quantityAvailable: 50,
                  quantityLimit: 10,
                  rating: 5,
                  unit: "KG",
                  weight: 0.8,
                  amount: "0.998",
                  undiscountedAmount: "0.998",
                  media: [
                    "https://alhowaridates.eu.saleor.cloud/media/products/Al_Dar_Jordanian_Luxury_Molasses_800g_e7e935ac.png"
                  ],
                  pageInfo: null,
                  category: CategoryModel(
                      id: "Q2F0ZWdvcnk6NTI=",
                      name: "دبس",
                      desciption: null,
                      backgroundImage:
                          "https://alhowaridates.eu.saleor.cloud/media/category-backgrounds/10_01bee22d.jpg",
                      products: null),
                  currency: 'JOD'),
              currency: "JOD",
              unitPrice: 0.998,
              undiscountedPrice: 0.998,
              totalPrice: 0.998)
        ],
        discountAmount: 0,
        shippingMethods: [
          ShippingMethod(
              id: "U2hpcHBpbmdNZXRob2Q6NTM=",
              name: "حسب السعﻻ",
              description: null,
              price: 2,
              currency: "JOD",
              maximumDeliveryDays: null,
              minimumDeliveryDays: null)
        ],
        shippingAddress: AddressModel(
            id: '',
            firstName: "خالد",
            lastName: "كشميري",
            streetAddress1: "شارع عبدالفتاح صبحي",
            streetAddress2: '',
            city: "الزرقاء",
            postalCode: "11320"));
 });

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
}

}
