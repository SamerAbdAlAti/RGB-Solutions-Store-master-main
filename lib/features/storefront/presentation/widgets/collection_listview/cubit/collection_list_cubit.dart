import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/collection.dart';

part 'collection_list_cubit.freezed.dart';
part 'collection_list_state.dart';

class CollectionListCubit extends Cubit<CollectionListState> {
  final Future<Collection>? collection;
  final Future<List<Collection>>? collections;
  CollectionListCubit(this.collection, this.collections)
      : super(const CollectionListState.loading());

  Future<void> unwrapFuture() async {
    bool isSingle = false;
    try {
      emit(const CollectionListState.loading());
      collection != null ? isSingle = true : isSingle = false;
      if (isSingle) {
        final singleCollection = await collection;
        if (singleCollection != null) {
          emit(CollectionListState.ready([singleCollection]));
        } else {
          emit(const CollectionListState.error("لا يوجد مجموعات"));
        }
      } else {
        final multiCollections = await collections;
        if (multiCollections != null) {
          emit(CollectionListState.ready(multiCollections));
        } else {
          emit(const CollectionListState.error("لا يوجد مجموعات"));
        }
      }
    } on Exception {
      emit(const CollectionListState.error("حدث خطأ في الخادم"));
    }
  }
}
