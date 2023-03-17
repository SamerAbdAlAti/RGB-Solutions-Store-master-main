import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/poster.dart';

abstract class StoreInformationRepository {
  Future<Either<Failure, List<Poster>>>? getHomeHugePoster();
  Future<Either<Failure, List<Poster>>>? getHomeSnapListPoster();
  Future<Either<Failure, List<Poster>>>? getHomeWallPoster();
}
