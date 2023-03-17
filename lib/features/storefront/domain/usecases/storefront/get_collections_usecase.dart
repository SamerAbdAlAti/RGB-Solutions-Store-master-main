import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/collection.dart';
import '../../repositories/storefront_repository.dart';

@lazySingleton
class GetCollectionsUseCase
    implements UseCase<List<Collection>, CollectionParams> {
  final StorefrontRepository repository;

  GetCollectionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Collection>>?> call(
      CollectionParams params) async {
    return await repository.getCollections(
        amount: params.amount,
        amountOfProducts: params.amountOfProducts,
        after: params.after,
        before: params.before);
  }
}

class CollectionParams extends Equatable {
  final int amount;
  final int amountOfProducts;
  final String? after;
  final String? before;

  const CollectionParams(
      {required this.amount,
      required this.amountOfProducts,
      required this.after,
      required this.before});

  @override
  List<Object?> get props => [amount, amountOfProducts, after, before];
}
