import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/utl/secrets.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_auth_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_checkout_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/category_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/checkout_line_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';

void main() {
  RemoteCheckoutDatasource checkoutDatasource = IRemoteCheckoutDatasource();

  test("checkout result", () async {
    // await checkoutDatasource.updateCheckoutLine(
    //     // linesIds: ["Q2hlY2tvdXRMaW5lOmJlOThlYjU5LWQyMDMtNDljZi04NjRiLTI5ODlkY2I1YzZjZQ=="],
    //     checkoutId:
    //         "Q2hlY2tvdXQ6ZmU5MWY1N2ItY2NmNi00MmQzLWE2YzAtNDM4ZmU2MWY4MGJj",
    //     // checkoutId:
    //     //     "Q2hlY2tvdXQ6ZmU5MWY1N2ItY2NmNi00MmQzLWE2YzAtNDM4ZmU2MWY4MGJj",
    //     lineId:
    //         "Q2hlY2tvdXRMaW5lOmMzZWY2OGMzLTQxOTgtNDE3OS1iYmM0LTc2ZGZlYWNjODU1Nw==",
    //     newLine: CheckoutLineModel(
    //         id:
    //             'Q2hlY2tvdXRMaW5lOmMzZWY2OGMzLTQxOTgtNDE3OS1iYmM0LTc2ZGZlYWNjODU1Nw==',
    //         quantity: 5,
    //         variantId: "UHJvZHVjdFZhcmlhbnQ6NDM0",
    //         variantName: '',
    //         product: ProductModel(
    //             id: "UHJvZHVjdDoxNDU=",
    //             unit: "KG",
    //             isAvailable: true,
    //             variantId: '',
    //             variantName: '',
    //             rating: 1,
    //             weight: 0.8,
    //             name: "Battle-tested at brands like Lush",
    //             description:
    //                 "{\"time\": 1652811542659, \"blocks\": [{\"id\": \"g2sLxZcLZa\", \"data\": {\"text\": \"Scale <b>effortlessly</b>\"}, \"type\": \"paragraph\"}], \"version\": \"2.22.2\"}",
    //             thumbnail:
    //                 "https://alhowaridates.eu.saleor.cloud/media/thumbnails/products/saleor-battle-tested-book_thumbnail_256.png",
    //             currency: "USD",
    //             amount: "10",
    //             category: CategoryModel(
    //                 id: "Q2F0ZWdvcnk6MjY=",
    //                 name: "Audiobooks",
    //                 desciption: null,
    //                 backgroundImage: null),
    //             quantityAvailable: 50,
    //             quantityLimit: null,
    //             undiscountedAmount: "10",
    //             pageInfo: null,
    //             media: [
    //               "https://alhowaridates.eu.saleor.cloud/media/products/saleor-battle-tested-book.png"
    //             ]),
    //         currency: '',
    //         unitPrice: 1,
    //         undiscountedPrice: 1),
    //     token:
    //         "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEiLCJ0eXAiOiJKV1QifQ.eyJpYXQiOjE2NzQ5NDQyNzgsIm93bmVyIjoic2FsZW9yIiwiaXNzIjoiaHR0cHM6Ly9hbGhvd2FyaWRhdGVzLmV1LnNhbGVvci5jbG91ZC9ncmFwaHFsLyIsImV4cCI6MTY3NDk0NDU3OCwidG9rZW4iOiJTNWlLVmE5REFzdW0iLCJlbWFpbCI6Ijk2NjUwNjQ1OTY1MUBwaG9uZS5jb20iLCJ0eXBlIjoiYWNjZXNzIiwidXNlcl9pZCI6IlZYTmxjam95TURVNU9EQTFNalF6IiwiaXNfc3RhZmYiOmZhbHNlfQ.D72zRq3pfVA420xnkHGp39bfikEyxQkwtYpuj0vA1QtPMJez0n2PFI1XhNJBTvHxMve0XPBN3rWiZEwGWr8nxLh1Ks8QWh4nhc6LAXGbPGeYkt_IuTOjxhRVaUJBAgJAHm8fGtHM2sBzGwa6XUt2V0m7COK38pcYmNYwTlzjFVhKsjbXFz8yZHZ6XChfbdmDhvI3Jhsc7lLCCzQ-xbpGiN-Id07HT0Q4dpILpCjm0VhN005DI6n8AYQO_2R95OvomP9lDK8HRtMi26XKXPTBa7Eaw9CZX1MPM7rcKv2qMFSjtd_NdGTWJo_5JjVzmUWjqbZZVqTdm2HnPSJ6fqDndQ");
  });

  test(
    "update address return checkout",
    () async {
      try {
        final result = await checkoutDatasource.updateShippingAddress(
            checkoutId:
                "Q2hlY2tvdXQ6MTkwMGIzMDAtMmQ2Yy00OWZjLWE2NTEtZWJiYzg2Yzc3Y2Ni",
            address: AddressModel(
                id: '',
                firstName: "محمد",
                lastName: 'خالد',
                streetAddress1: "شسي",
                streetAddress2: "شسي",
                city: "شسي",
                postalCode: "13756", country: '', cityArea: ''),
            token:
                "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEiLCJ0eXAiOiJKV1QifQ.eyJpYXQiOjE2NzUyMTM4MzksIm93bmVyIjoic2FsZW9yIiwiaXNzIjoiaHR0cHM6Ly9hbGhvd2FyaWRhdGVzLmV1LnNhbGVvci5jbG91ZC9ncmFwaHFsLyIsImV4cCI6MTY3NTIxNDEzOSwidG9rZW4iOiJZUlVrZmE3bDBqZ1EiLCJlbWFpbCI6Ijk2NjUwNjQ1OTY1MUBwaG9uZS5jb20iLCJ0eXBlIjoiYWNjZXNzIiwidXNlcl9pZCI6IlZYTmxjam95TURVNU9EQTFNamd4IiwiaXNfc3RhZmYiOmZhbHNlfQ.xDHwaFltZE5Fgh1dWso-Zu-v32gSoFdFuMSGfCUCuQNq7b2rEDRIXmoSh4wIFpurvQyb-us3sCaksFOvXAb97toyzhlKAXXz0qSRykoiV5oG3QvOCyNt3G47GGlwbcuav93BnvmI72jj7GaOLoxMVARaIpeLoT_593LXNCOvwvv1Y5Ai9Y1Q73FJ43Tqwb71jCBenXp3nVxK9qmtUvTyGPlkQKclWD1y-3eSlPnTLa-JYLd-IzfbRaz1pkyEIuBNElPmMJJVww8jbiX889UlUdEYvQq4gLsW4fcDT_bJptuhOTELCMRzEBZsuux5j7blxh_ZsLvT8MCLcIOZSMBsRg");
        print(result);
      } on InformationException catch (error) {
        print(error.message);
      }
    },
  );

  test('auth is token valid', () async {
    final authRemote = IAuthDatasource(
        GraphQLClient(cache: GraphQLCache(), link: Constants.apiLink));

    print(await authRemote.isTokenValid(
        token:
            "eyJhbGciOiJSUzI1NiIsImtpZCI6IjEiLCJ0eXAiOiJKV1QifQ.eyJpYXQiOjE2NzQ5OTc4MzQsIm93bmVyIjoic2FsZW9yIiwiaXNzIjoiaHR0cHM6Ly9hbGhvd2FyaWRhdGVzLmV1LnNhbGVvci5jbG91ZC9ncmFwaHFsLyIsImV4cCI6MTY3NDk5ODEzNCwidG9rZW4iOiJTNWlLVmE5REFzdW0iLCJlbWFpbCI6Ijk2NjUwNjQ1OTY1MUBwaG9uZS5jb20iLCJ0eXBlIjoiYWNjZXNzIiwidXNlcl9pZCI6IlZYTmxjam95TURVNU9EQTFNalF6IiwiaXNfc3RhZmYiOmZhbHNlfQ.oT2WL1YZxWTBPHhjni7jwGefo5QTzLrhNbYWz0usz0I744W-5n5lhwbt66Vddg4ulcMJkDx1xikUyjExblKnUkYMf6dTufG8UU1vvIFKfeUR5raXjLjrC31rIR6iAlQnQ7ESdglYKbAeBq5xSevMOUM2oe0vM7x-BDE5EDRM90QzW9IPP5JF9I1tBexUB0w1PhKFDMDgVc_jXsMLlr-MTqp7D0dHOx2fUgA2QAqGLz5ZcJOQXKiX7rZPZQoQ3AvI3guYgzH5gDPV21BJdNn15dTeuzsJflr36i72pIO2_QaxQ2mMKndj3hAr49KWF-hZ5uOcH1ET56Y1CmWcFwoEHg"));
  });
}
