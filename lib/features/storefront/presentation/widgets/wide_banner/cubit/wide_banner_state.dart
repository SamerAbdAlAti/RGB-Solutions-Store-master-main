part of 'wide_banner_cubit.dart';

@freezed
class WideBannerState with _$WideBannerState {
  const factory WideBannerState.initial() = _Initial;
  const factory WideBannerState.loading() = _Loading;
  const factory WideBannerState.loaded(List<Poster> bannersData) = _Loaded;
  const factory WideBannerState.error(dynamic error) = _Error;
}
