// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';

@lazySingleton
class SearchProdcutsUseCase
    implements UseCase<List<Product>, SearchPrams> {
  final StorefrontRepository repository;

  SearchProdcutsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>?> call(
      SearchPrams params) async {
    return await repository.searchProducts(params.term, params.amount);
  }
}

class SearchPrams extends Equatable {
  final String term;
  final int amount;

  const SearchPrams({
    required this.term,
    required this.amount,
  });

  @override
  List<Object?> get props => [term, amount];
}
