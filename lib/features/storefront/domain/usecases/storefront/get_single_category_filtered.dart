// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product_filter.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';

@lazySingleton
class GetSingleCategoryFilteredUseCase
    implements UseCase<Category, FilterSingleCategoryParams> {
  final StorefrontRepository repository;

  GetSingleCategoryFilteredUseCase(this.repository);

  @override
  Future<Either<Failure, Category>?> call(params) async {
    return await repository.singleCategoryFiltered(
        id: params.id,
        channel: params.channel,
        amountOfProducts: params.amountOfProducts,
        productFilter: params.productFilter,
        after: params.after,
        before: params.before);
  }
}

class FilterSingleCategoryParams extends Equatable {
  String id;
  String channel;
  int amountOfProducts;
  ProductFilter productFilter;
  String? before;
  String? after;
  FilterSingleCategoryParams({
    required this.id,
    required this.channel,
    required this.amountOfProducts,
    required this.productFilter,
    this.before,
    this.after,
  });
  @override
  List<Object?> get props =>
      [id, channel, amountOfProducts, productFilter, before, after];
}
