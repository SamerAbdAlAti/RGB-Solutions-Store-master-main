import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart' hide ServerException;
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/graphql/checkout/checkout_mutations.dart';
import 'package:saleor_app_flutter/core/utl/secrets.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/address_model.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/checkout_model.dart';

abstract class RemoteCheckoutDatasource {
  Future<CheckoutModel> checkoutCreate(
      {required String variantId,
      required int quantity,
      required String token});
  Future<CheckoutModel> addCheckoutLine(
      {required String checkoutId,
      required String variantId,
      required int quantity,
      required String token});
  Future<CheckoutModel> deleteCheckoutLine(
      {required String checkoutId,
      required List<String> linesIds,
      required String token});
  Future<CheckoutModel> updateCheckoutLine(
      {required String checkoutId,
      required String lineId,
      required int quantity,
      required String token});
  Future<CheckoutModel> updateShippingAddress(
      {required String checkoutId,
      required AddressModel address,
      required String token});
  Future<CheckoutModel> addCobon(
      {required String checkoutId,
      required String cobon,
      required String token});
  Future<CheckoutModel> removeCobon(
      {required String checkoutId,
      required String cobon,
      required String token});
}

@LazySingleton(as: RemoteCheckoutDatasource)
class IRemoteCheckoutDatasource implements RemoteCheckoutDatasource {
  // final _superClient = GraphQLClient(
  //     link: Constants.authLink, cache: GraphQLCache(store: InMemoryStore()));

  @override
  Future<CheckoutModel> addCheckoutLine(
      {required String checkoutId,
      required String variantId,
      required int quantity,
      required String token}) async {
    try {
      QueryResult<Object?> result = await GraphQLClient(
              link: Constants.userAuthLink(token),
              cache: GraphQLCache(store: InMemoryStore()))
          .mutate(
        MutationOptions(
            document: gql(CheckoutMutations.addCheckoutLine),
            variables: {
              "id": checkoutId,
              "variantId": variantId,
              "quantity": quantity
            }),
      );
      if (result.hasException) {
        throw InformationException(
            message: result.exception!.graphqlErrors[0].extensions!['exception']
                ['code']);
      }
      if ((result.data!['checkoutLinesAdd']['errors'] as List).isNotEmpty) {
        if (result.data!['checkoutLinesAdd']['errors'][0]['code'] ==
            "QUANTITY_GREATER_THAN_LIMIT") {
          throw InformationException(
              message: 'لقد تجاوزت الحد ﻹضافة هذا المنتج');
        }
      }
      return CheckoutModel.fromMap(
          result.data!['checkoutLinesAdd']['checkout']);
    } on InformationException catch (error) {
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<CheckoutModel> checkoutCreate(
      {required String variantId,
      required int quantity,
      required String token}) async {
    try {
      QueryResult<Object?> result = await GraphQLClient(
              link: Constants.userAuthLink(token),
              cache: GraphQLCache(store: InMemoryStore()))
          .mutate(
        MutationOptions(
            document: gql(CheckoutMutations.createCheckout),
            variables: {"variantId": variantId, "quantity": quantity}),
      );
      if (result.data!['checkoutCreate']['checkout'] == null) {
        throw InformationException(message: "المعلومات غير صحيحة.");
      }
      if (result.hasException) {
        throw InformationException(
            message: result.exception!.graphqlErrors[0].extensions!['exception']
                ['code']);
      }
      return CheckoutModel.fromMap(result.data!['checkoutCreate']['checkout']);
    } on InformationException catch (msg) {
      throw InformationException(message: msg.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<CheckoutModel> deleteCheckoutLine(
      {required String checkoutId,
      required List<String> linesIds,
      required String token}) async {
    try {
      QueryResult<Object?> result = await GraphQLClient(
              link: Constants.userAuthLink(token),
              cache: GraphQLCache(store: InMemoryStore()))
          .mutate(
        MutationOptions(
            document: gql(CheckoutMutations.deleteCheckoutLines),
            variables: {"id": checkoutId, "linesIds": linesIds}),
      );

      if (result.hasException) {
        throw InformationException(
            message: result.exception!.graphqlErrors[0].extensions!['exception']
                ['code']);
      }
      if (result.data!['checkoutLinesDelete']['checkout'] == null) {
        throw InformationException(message: "هذا الصنف لا يوجد في السلة.");
      }
      return CheckoutModel.fromMap(
          result.data!['checkoutLinesDelete']['checkout']);
    } on InformationException catch (msg) {
      throw InformationException(message: msg.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<CheckoutModel> updateCheckoutLine(
      {required String checkoutId,
      required String lineId,
      required int quantity,
      required String token}) async {
    try {
      QueryResult<Object?> result = await GraphQLClient(
              link: Constants.userAuthLink(token),
              cache: GraphQLCache(store: InMemoryStore()))
          .mutate(
        MutationOptions(
            document: gql(CheckoutMutations.updateCheckoutLines),
            variables: {
              "checkoutId": checkoutId,
              "lineId": lineId,
              "quantity": quantity
            }),
      );
      if (result.hasException) {
        throw InformationException(
            message: result.exception!.graphqlErrors[0].extensions!['exception']
                ['code']);
      }
      if (result.data!['checkoutLinesUpdate']['checkout'] == null) {
        throw InformationException(message: "لا يوجد منتج لتحديث بياناته.");
      }
      return CheckoutModel.fromMap(
          result.data!['checkoutLinesUpdate']['checkout']);
    } on InformationException catch (error) {
      debugPrint("updateCheckoutLine: ${error.message}");
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<CheckoutModel> updateShippingAddress(
      {required String checkoutId,
      required AddressModel address,
      required String token}) async {
    try {
      QueryResult<Object?> result = await GraphQLClient(
              link: Constants.userAuthLink(token),
              cache: GraphQLCache(store: InMemoryStore()))
          .mutate(
        MutationOptions(
            document: CheckoutMutations.setCheckoutAddress,
            variables: {
              "firstName": address.firstName,
              "lastName": address.lastName,
              "street1": address.streetAddress1,
              "street2": address.streetAddress2,
              "postcode": address.postalCode,
              "city": address.city,
              "cityArea": address.cityArea,
              "country": "JO",
              "id": checkoutId
            }),
      );
      if (result.hasException) {
        throw InformationException(
            message: result.exception!.graphqlErrors[0].extensions!['exception']
                ['code']);
      }
      if (result.data!['checkoutShippingAddressUpdate']['checkout'] == null) {
        if (result.data!['checkoutShippingAddressUpdate']['errors'][0]
                ['field'] ==
            "postalCode") {
          throw InformationException(message: "الرمز البريدي غير صالح.");
        }
        // throw InformationException(message: "لم يتم تحديث العنوان");
      }
      return CheckoutModel.fromMap(
          result.data!['checkoutShippingAddressUpdate']['checkout']);
    } on InformationException catch (error) {
      debugPrint("updateShippingAddress: ${error.message}");
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<CheckoutModel> addCobon(
      {required String checkoutId,
      required String cobon,
      required String token}) async {
    try {
      QueryResult<Object?> result = await GraphQLClient(
              link: Constants.userAuthLink(token),
              cache: GraphQLCache(store: InMemoryStore()))
          .mutate(
        MutationOptions(
            document: gql(CheckoutMutations.addCobon),
            variables: {"id": checkoutId, "promoCode": cobon}),
      );
      if (result.hasException) {
        throw InformationException(
            message: result.exception!.graphqlErrors[0].extensions!['exception']
                ['code']);
      }
      if (result.data!['checkoutAddPromoCode']['checkout'] == null) {
        if (result.data!['checkoutAddPromoCode']['errors'][0]['code'] ==
            "INVALID") {
          throw InformationException(message: "لا يوجد كوبون بهذا الرمز");
        } else {
          debugPrint(
              "addCobon1: ${result.data!['checkoutRemovePromoCode']['errors'][0]}");
          throw InformationException(message: "لا تستوفى شروط تطبيق الكوبون");
        }
      }
      return CheckoutModel.fromMap(
          result.data!['checkoutAddPromoCode']['checkout']);
    } on InformationException catch (error) {
      debugPrint("addCobon: ${error.message}");
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<CheckoutModel> removeCobon(
      {required String checkoutId,
      required String cobon,
      required String token}) async {
    try {
      QueryResult<Object?> result = await GraphQLClient(
              link: Constants.userAuthLink(token),
              cache: GraphQLCache(store: InMemoryStore()))
          .mutate(
        MutationOptions(
            document: gql(CheckoutMutations.removeCobon),
            variables: {"id": checkoutId, "promoCode": cobon}),
      );
      if (result.hasException) {
        throw InformationException(
            message: result.exception!.graphqlErrors[0].extensions!['exception']
                ['code']);
      }
      if (result.data!['checkoutRemovePromoCode']['checkout'] == null) {
        if (result.data!['checkoutRemovePromoCode']['errors'][0]['code'] ==
            "INVALID") {
          throw InformationException(message: "لا يوجد كوبون بهذا الرمز");
        } else {
          debugPrint("removeCobon1: " +
              result.data!['checkoutRemovePromoCode']['errors'][0]);
          throw InformationException(message: "لا يمكن حذف الكوبون");
        }
      }
      return CheckoutModel.fromMap(
          result.data!['checkoutRemovePromoCode']['checkout']);
    } on InformationException catch (error) {
      debugPrint("removeCobon: ${error.message}");
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }
}
