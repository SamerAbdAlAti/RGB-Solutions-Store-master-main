// Mocks generated by Mockito 5.3.2 from annotations
// in saleor_app_flutter/test/features/storefront/domain/usecases/storefront/get_products_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:saleor_app_flutter/core/error/failures.dart' as _i5;
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart'
    as _i7;
import 'package:saleor_app_flutter/features/storefront/domain/entities/collection.dart'
    as _i8;
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart'
    as _i6;
import 'package:saleor_app_flutter/features/storefront/domain/entities/product_filter.dart'
    as _i9;
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [StorefrontRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockStorefrontRepository extends _i1.Mock
    implements _i3.StorefrontRepository {
  MockStorefrontRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>? getProducts({
    required int? number,
    required String? channel,
    String? before,
    String? after,
  }) =>
      (super.noSuchMethod(Invocation.method(
        #getProducts,
        [],
        {
          #number: number,
          #channel: channel,
          #before: before,
          #after: after,
        },
      )) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>?);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Product>>? getSingleProduct(
    String? id,
    String? channel,
  ) =>
      (super.noSuchMethod(Invocation.method(
        #getSingleProduct,
        [
          id,
          channel,
        ],
      )) as _i4.Future<_i2.Either<_i5.Failure, _i6.Product>>?);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.Category>>>? getCategories({
    required int? amount,
    required String? channel,
    required int? amountOfProducts,
    String? before,
    String? after,
  }) =>
      (super.noSuchMethod(Invocation.method(
        #getCategories,
        [],
        {
          #amount: amount,
          #channel: channel,
          #amountOfProducts: amountOfProducts,
          #before: before,
          #after: after,
        },
      )) as _i4.Future<_i2.Either<_i5.Failure, List<_i7.Category>>>?);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Collection>>>? getCollections({
    required int? amount,
    required int? amountOfProducts,
    String? before,
    String? after,
  }) =>
      (super.noSuchMethod(Invocation.method(
        #getCollections,
        [],
        {
          #amount: amount,
          #amountOfProducts: amountOfProducts,
          #before: before,
          #after: after,
        },
      )) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.Collection>>>?);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.Collection>>? getSingleCollection({
    required String? id,
    required int? amountOfProducts,
    String? before,
    String? after,
  }) =>
      (super.noSuchMethod(Invocation.method(
        #getSingleCollection,
        [],
        {
          #id: id,
          #amountOfProducts: amountOfProducts,
          #before: before,
          #after: after,
        },
      )) as _i4.Future<_i2.Either<_i5.Failure, _i8.Collection>>?);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.Category>>? getSingleCategory({
    required String? id,
    required String? channel,
    required int? amountOfProducts,
    String? before,
    String? after,
  }) =>
      (super.noSuchMethod(Invocation.method(
        #getSingleCategory,
        [],
        {
          #id: id,
          #channel: channel,
          #amountOfProducts: amountOfProducts,
          #before: before,
          #after: after,
        },
      )) as _i4.Future<_i2.Either<_i5.Failure, _i7.Category>>?);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.Category>> singleCategoryFiltered({
    required String? id,
    required String? channel,
    required int? amountOfProducts,
    required _i9.ProductFilter? productFilter,
    String? before,
    String? after,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #singleCategoryFiltered,
          [],
          {
            #id: id,
            #channel: channel,
            #amountOfProducts: amountOfProducts,
            #productFilter: productFilter,
            #before: before,
            #after: after,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i7.Category>>.value(
            _FakeEither_0<_i5.Failure, _i7.Category>(
          this,
          Invocation.method(
            #singleCategoryFiltered,
            [],
            {
              #id: id,
              #channel: channel,
              #amountOfProducts: amountOfProducts,
              #productFilter: productFilter,
              #before: before,
              #after: after,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i7.Category>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>> searchProducts(
    String? term,
    int? amount,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchProducts,
          [
            term,
            amount,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Product>>(
          this,
          Invocation.method(
            #searchProducts,
            [
              term,
              amount,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Product>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.Category>>> searchCategories(
    String? term,
    int? amount,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchCategories,
          [
            term,
            amount,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i7.Category>>>.value(
                _FakeEither_0<_i5.Failure, List<_i7.Category>>(
          this,
          Invocation.method(
            #searchCategories,
            [
              term,
              amount,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i7.Category>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Collection>>> searchCollections(
    String? term,
    int? amount,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchCollections,
          [
            term,
            amount,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i8.Collection>>>.value(
                _FakeEither_0<_i5.Failure, List<_i8.Collection>>(
          this,
          Invocation.method(
            #searchCollections,
            [
              term,
              amount,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.Collection>>>);
}