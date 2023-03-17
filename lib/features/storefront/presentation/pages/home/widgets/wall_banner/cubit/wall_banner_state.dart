part of 'wall_banner_cubit.dart';

@freezed
class WallBannerState with _$WallBannerState {
  const factory WallBannerState.initial() = _Initial;
  const factory WallBannerState.loading() = _Loading;
  const factory WallBannerState.loaded(List<Poster> bannersData) = _Loaded;
  const factory WallBannerState.error(dynamic error) = _Error;
}
