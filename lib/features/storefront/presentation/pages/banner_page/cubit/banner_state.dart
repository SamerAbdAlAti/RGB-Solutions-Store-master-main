part of 'banner_cubit.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState.initial(
      Tuple3<List<Poster>, List<Poster>, List<Poster>> posters) = _Initial;
  const factory BannerState.saved(
      Tuple3<List<Poster>, List<Poster>, List<Poster>> posters) = _Saved;
  const factory BannerState.loading() = _Loading;
  const factory BannerState.error(String message) = _Error;
}
