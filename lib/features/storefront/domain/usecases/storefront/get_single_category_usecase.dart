// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';

@lazySingleton
class GetSingleCategoryUseCase implements UseCase<Category, CategoryParams> {
  final StorefrontRepository repository;

  GetSingleCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, Category>?> call(CategoryParams params) async {
    return await repository.getSingleCategory(
        id: params.id,
        channel: params.channel,
        amountOfProducts: params.amountOfProducts,
        after: params.after,
        before: params.before);
  }
}

class CategoryParams extends Equatable {
  final String id;
  final String channel;
  final int amountOfProducts;
  final String? after;
  final String? before;
  const CategoryParams(
      {required this.id,
      required this.channel,
      required this.amountOfProducts,
      this.after,
      this.before});

  @override
  List<Object?> get props => [id, channel, amountOfProducts, after, before];
}
