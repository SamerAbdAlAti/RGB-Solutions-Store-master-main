// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/collection.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/storefront/search_products_usecase.dart';

@lazySingleton
class SearchCollectionsUseCase
    implements UseCase<List<Collection>, SearchPrams> {
  final StorefrontRepository repository;

  SearchCollectionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Collection>>?> call(
      SearchPrams params) async {
    return await repository.searchCollections(params.term, params.amount);
  }
}
