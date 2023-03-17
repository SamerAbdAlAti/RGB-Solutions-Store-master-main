import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/poster.dart';

part 'wide_banner_state.dart';
part 'wide_banner_cubit.freezed.dart';

class WideBannerCubit extends Cubit<WideBannerState> {
  final Future<List<Poster>> callback;

  WideBannerCubit(this.callback) : super(const WideBannerState.initial());

  Future<void> initPoster() async {
    try {
      emit(const WideBannerState.loading());
      final posters = await callback;
      emit(WideBannerState.loaded(posters));
    } on Exception catch (error) {
      if (kDebugMode) print("Error in WideBannerCubit: $error");
      emit(WideBannerState.error(error));
    }
  }
}
