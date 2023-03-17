part of 'snaplist_poster_cubit.dart';

@freezed
class SnaplistPosterState with _$SnaplistPosterState {
  const factory SnaplistPosterState.initial() = _Initial;
  const factory SnaplistPosterState.loading() = _Loading;
  const factory SnaplistPosterState.loaded(List<Poster> bannersData, List<Product> product) = _Loaded;
  const factory SnaplistPosterState.error(dynamic error) = _Error;
}
