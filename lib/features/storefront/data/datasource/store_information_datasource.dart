import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../models/poster_model.dart';
import '../../domain/entities/poster.dart';

abstract class StoreInformationDatasource {
  Future<List<Poster>> getHomeHugePoster();
  Future<List<Poster>> getHomeSnapListPoster();
  Future<List<Poster>> getHomeWallPoster();
}

@LazySingleton(as: StoreInformationDatasource)
class IStoreInformationDatasource implements StoreInformationDatasource {
  final FirebaseFirestore instance;

  IStoreInformationDatasource(this.instance);

  @override
  Future<List<Poster>> getHomeHugePoster() async {
    return await _getPosters('huge');
  }

  @override
  Future<List<Poster>> getHomeSnapListPoster() async {
    return await _getPosters('snaplist');
  }

  @override
  Future<List<Poster>> getHomeWallPoster() async {
    return await _getPosters('wall');
  }

  Future<List<Poster>> _getPosters(String key) async {
    try {
      final result = await instance
          .collection('banners')
          .doc('home')
          .get()
          .then((value) => value.data()![key])
          .onError((error, stackTrace) => []);
      if (result == null) return [];
      return result
          .map((e) => PosterModel.fromMap(e))
          .cast<PosterModel>()
          .toList();
    } on Exception catch (exception) {
      if (kDebugMode) print(exception);
      throw ServerException();
    }
  }
}
