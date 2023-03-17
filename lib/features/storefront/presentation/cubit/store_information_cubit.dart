// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/error/failures.dart';
import 'package:saleor_app_flutter/core/usecase/usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/poster.dart';

import 'package:saleor_app_flutter/features/storefront/domain/usecases/store_information/get_home_huge_poster_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/store_information/get_home_snaplist_poster_usecase.dart';
import 'package:saleor_app_flutter/features/storefront/domain/usecases/store_information/get_home_wall_poster_usecase.dart';

part 'store_information_cubit.freezed.dart';
part 'store_information_state.dart';

@injectable
class StoreInformationCubit extends Cubit<StoreInformationState> {
  final GetHomeHugePosterUseCase _homeHugePoster;
  final GetHomeSnapListPosterUseCase _homeSnapListPoster;
  final GetHomeWallPosterUseCase _homeWallPoster;
  StoreInformationCubit(
    this._homeHugePoster,
    this._homeSnapListPoster,
    this._homeWallPoster,
  ) : super(const StoreInformationState.initial());

  Future<List<Poster>> getHomeHugePoster() async {
    final either = await _homeHugePoster(NoParams());
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<List<Poster>> getHomeWallPoster() async {
    final either = await _homeWallPoster(NoParams());
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Future<List<Poster>> getHomeListPoster() async {
    final either = await _homeSnapListPoster(NoParams());
    return either!.fold((l) => throw _getFailureAndThrowException(l), (r) => r);
  }

  Exception _getFailureAndThrowException(Failure l) {
    switch (l.runtimeType) {
      case ServerFailure:
        return ServerException();
      case CacheFailure:
        return CacheException();
      default:
        return UnexpectedException();
    }
  }
}
