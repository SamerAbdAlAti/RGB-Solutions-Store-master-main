part of 'collection_list_cubit.dart';

@freezed
class CollectionListState with _$CollectionListState {
  const factory CollectionListState.loading() = _Loading;
  const factory CollectionListState.ready(List<Collection> collections) =
      _Ready;
  const factory CollectionListState.error(String message) = _Error;
}
