part of 'wish_list_cubit.dart';

@freezed
class WishListState with _$WishListState {
  const factory WishListState.idle() = _Idle;
  const factory WishListState.loading() = _Loading;
  const factory WishListState.finished() = _Finished;
}
