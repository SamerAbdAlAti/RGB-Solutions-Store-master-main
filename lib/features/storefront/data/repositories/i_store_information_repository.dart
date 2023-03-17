// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/exceptions.dart';

import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/features/storefront/data/datasource/store_information_datasource.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/poster.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/store_information_repository.dart';

typedef _Posters = Future<List<Poster>> Function();

@LazySingleton(as: StoreInformationRepository)
class IStoreInformationRepository implements StoreInformationRepository {
  final StoreInformationDatasource datasource;
  IStoreInformationRepository({
    required this.datasource,
  });
  @override
  Future<Either<Failure, List<Poster>>>? getHomeHugePoster() async {
    return await _getBody(() => datasource.getHomeHugePoster());
  }

  @override
  Future<Either<Failure, List<Poster>>>? getHomeSnapListPoster() async {
    return await _getBody(() => datasource.getHomeSnapListPoster());
  }

  @override
  Future<Either<Failure, List<Poster>>>? getHomeWallPoster() async {
    return await _getBody(() => datasource.getHomeWallPoster());
  }

  Future<Either<Failure, List<Poster>>> _getBody(_Posters posterCall) async {
    try {
      final posters = await posterCall();
      return Right(posters);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
