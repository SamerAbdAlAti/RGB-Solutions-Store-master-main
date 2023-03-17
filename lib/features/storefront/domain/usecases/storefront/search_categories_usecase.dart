// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/category.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/search_products_usecase.dart';

@lazySingleton
class SearchCategoriesUseCase implements UseCase<List<Category>, SearchPrams> {
  final StorefrontRepository repository;

  SearchCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Category>>?> call(SearchPrams params) async {
    return await repository.searchCategories(params.term, params.amount);
  }
}
