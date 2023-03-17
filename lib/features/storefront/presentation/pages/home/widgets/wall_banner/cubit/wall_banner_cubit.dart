import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../domain/entities/poster.dart';


part 'wall_banner_cubit.freezed.dart';
part 'wall_banner_state.dart';

class WallBannerCubit extends Cubit<WallBannerState> {
  WallBannerCubit() : super(const WallBannerState.initial());

  Future<void> mapDataToBanner(Future<List<Poster>> fetch) async {
    try {
      emit(const WallBannerState.loading());
      final result = await fetch;
      emit(WallBannerState.loaded(result));
    } on Exception catch (error) {
      emit(WallBannerState.error(error));
    }
  }
}
