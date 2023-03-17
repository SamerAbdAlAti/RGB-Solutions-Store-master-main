// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/storefront_repository.dart';

@lazySingleton
class GetProductsUseCase implements UseCase<List<Product>, ProductsPrams> {
  final StorefrontRepository repository;

  GetProductsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Product>>?> call(ProductsPrams params) async {
    return await repository.getProducts(
        number: params.number,
        channel: params.channel,
        after: params.after,
        before: params.before);
  }
}

class ProductsPrams extends Equatable {
  final int number;
  final String channel;
  final String? after;
  final String? before;

  const ProductsPrams({
    required this.number,
    required this.channel,
    this.after,
    this.before,
  });

  @override
  List<Object?> get props => [number, channel, after, before];
}
