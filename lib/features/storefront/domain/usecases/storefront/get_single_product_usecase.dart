import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/product.dart';
import '../../repositories/storefront_repository.dart';


@lazySingleton
class GetSingleProductUseCase implements UseCase<Product, SingleProductPrams> {
  final StorefrontRepository repository;

  GetSingleProductUseCase(this.repository);

  @override
  Future<Either<Failure, Product>?> call(SingleProductPrams prams) async {
    return repository.getSingleProduct(prams.id, prams.channel);
  }
}

class SingleProductPrams extends Equatable {
  final String id;
  final String channel;

  const SingleProductPrams(this.id, this.channel);

  @override
  List<Object?> get props => [id, channel];
}
