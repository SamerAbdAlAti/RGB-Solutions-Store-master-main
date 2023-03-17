import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/collection.dart';
import '../../repositories/storefront_repository.dart';

@lazySingleton
class GetSingleCollectionUseCase
    implements UseCase<Collection, SingleCollectionParams> {
  final StorefrontRepository repository;
  const GetSingleCollectionUseCase(this.repository);

  @override
  Future<Either<Failure, Collection>?> call(SingleCollectionParams params) async {
    return await repository.getSingleCollection(
        id: params.id,
        amountOfProducts: params.amountOfProducts,
        after: params.after,
        before: params.before);
  }
}

class SingleCollectionParams extends Equatable {
  final String id;
  final int amountOfProducts;
  final String? after;
  final String? before;

  const SingleCollectionParams(
      {required this.id,
      required this.amountOfProducts,
      required this.after,
      required this.before});

  @override
  List<Object?> get props => [id, amountOfProducts, after, before];
}
