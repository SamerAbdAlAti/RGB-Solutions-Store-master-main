part of 'review_cubit.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState.initial() = _Initial;
  const factory ReviewState.loading() = _Loading;
  const factory ReviewState.loaded(User? user, List<Review> reviews, double avgRating) = _Loaded;
  const factory ReviewState.error(String message) = _Error;
}
