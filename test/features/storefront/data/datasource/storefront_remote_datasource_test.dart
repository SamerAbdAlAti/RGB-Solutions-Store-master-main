import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/graphql/auth_mutations.dart';
import 'package:saleor_app_flutter/core/utl/secrets.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/remote_auth_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/storefront_remote_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/category_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/page_info_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/product_model.dart';

void main() {
  late GraphQLClient client;
  late IStorefrontRemoteDatasource remoteDatasource;
  late IAuthDatasource authDatasource;
  late List<ProductModel> tProductsModel;
  late ProductModel tSingleProductModel;
  late String tEmail;
  late String tPassword;
  late String tUserId;

  setUp(() {
    tSingleProductModel = ProductModel(
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
    tProductsModel = [
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
  });
  group("Exceptions", () {
    setUp(() {});
    test('should throw a [ServerFailure] when error happens', () async {
      try {
        // Assert
      } catch (ex) {
        expect(ex, ServerFailure());
      }
    });
  });

  group(
    "test results",
    () {
      setUp(
        () {
          client = GraphQLClient(
              link: HttpLink("https://alhowaridates.eu.saleor.cloud/graphql/"),
              cache: GraphQLCache(store: InMemoryStore()));
          remoteDatasource = IStorefrontRemoteDatasource(client);
          authDatasource = IAuthDatasource(client);
          tEmail = "email@email.em";
          tPassword = "password";
          tUserId = "VXNlcjoyMDU5ODA1MjI0";
        },
      );
      test(
        "activate account",
        () async {
          final _superClient = GraphQLClient(
              link: Constants.authLink,
              cache: GraphQLCache(store: InMemoryStore()));

          QueryResult<Object?> result = await _superClient.query(
            QueryOptions(
              document: AuthMutations.forcedUserData,
              variables: {'email': "962111111111@phone.com"},
            ),
          );
        },
      );
    },
  );
  group("NoExceptions", () {
    setUp(() {
      client = GraphQLClient(
          link: HttpLink("https://alhowaridates.eu.saleor.cloud/graphql/"),
          cache: GraphQLCache(store: InMemoryStore()));
      remoteDatasource = IStorefrontRemoteDatasource(client);
    });
    test('should return a valid list of product when graphql query is called',
        () async {
      // Arrange

      // Act
      final result = await remoteDatasource.getProducts(
          number: 1, channel: 'default-channel');
      // Assert
      expect(result, tProductsModel);
    });
    test('should return a valid product model when graphql query is called',
        () async {
      // Arrange

      // Act
      final result = await remoteDatasource.getSingleProduct(
          "UHJvZHVjdDoxNTI=", 'default-channel');
      // Assert
      expect(result, tSingleProductModel);
    });
  });
}
