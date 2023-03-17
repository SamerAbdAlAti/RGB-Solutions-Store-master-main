import 'package:injectable/injectable.dart';
import '../../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../entities/poster.dart';
import '../../repositories/store_information_repository.dart';

@lazySingleton
class GetHomeSnapListPosterUseCase implements UseCase<List<Poster>, NoParams> {
  final StoreInformationRepository repository;

  GetHomeSnapListPosterUseCase(this.repository);

  @override
  Future<Either<Failure, List<Poster>>?> call(NoParams params) async =>
      await repository.getHomeSnapListPoster();
}
