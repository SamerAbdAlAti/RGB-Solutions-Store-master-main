// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';

@lazySingleton
class GetCategoriesUseCase implements UseCase<List<Category>, CategoriesPrams> {
  final StorefrontRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Category>>?> call(CategoriesPrams params) async =>
      await repository.getCategories(
          amount: params.amount,
          channel: params.channel,
          amountOfProducts: params.amountOfProducts,
          after: params.after,
          before: params.before);
}

class CategoriesPrams extends Equatable {
  final int amount;
  final String channel;
  final int amountOfProducts;
  final String? after;
  final String? before;
  const CategoriesPrams({
    required this.amount,
    required this.channel,
    required this.amountOfProducts,
    this.after,
    this.before,
  });

  @override
  List<Object?> get props => [amount, channel, amountOfProducts, after, before];
}
