import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saleor_app_flutter/core/types/route_type.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain/entities/poster.dart';

part 'banner_cubit.freezed.dart';
part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(const BannerState.loading());

  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // List<Poster> _hugePosters = [];
  // List<Poster> _wallPosters = [];
  // List<Poster> _snaplistPosters = [];

  final uuid = const Uuid();

  // Future<Tuple3<List<Poster>, List<Poster>, List<Poster>>> allPostersFetch(BuildContext context) async {
  //   var cubitFunction = context.read<StoreInformationCubit>();
  //   final firstGroup = await cubitFunction.getHomeHugePoster();
  //   final secondGroup = await cubitFunction.getHomeWallPoster();
  //   final thirdGroup = await cubitFunction.getHomeListPoster();
  //   return tuple3(firstGroup, secondGroup, thirdGroup);
  // }

  // Future<Uint8List?> _pickFile() async {
  //   const XTypeGroup typeGroup = XTypeGroup(
  //     label: 'images',
  //     extensions: <String>['jpg', 'png', 'jpeg'],
  //   );
  //   XFile? imageFile = await openFile(acceptedTypeGroups: [typeGroup]);
  //   Uint8List? imageBytes =
  //       imageFile != null ? await imageFile.readAsBytes() : null;

  //   return imageBytes;
  // }

  // Tuple3<List<Poster>, List<Poster>, List<Poster>> get _getTuple =>
  //   tuple3(_hugePosters, _wallPosters, _snaplistPosters);

  void initPosters(
      Future<Tuple3<List<Poster>, List<Poster>, List<Poster>>> fetch) async {
    try {
      emit(const BannerState.loading());
      final posters = await fetch;
      emit(BannerState.saved(posters));
      await Future.delayed(const Duration(seconds: 1));
      emit(BannerState.initial(posters));
    } on Exception {
      emit(const BannerState.error("حدثت مشكلة اثناء طلب المجموعات"));
    }
  }

  Future<void> deleteImage(String imgUrl) async {
    try {
      Reference reference = storage.refFromURL(imgUrl);
      await reference.delete().onError((error, stackTrace) =>
          emit(const BannerState.error("حدث خطأ اثناء حضف الصورة القديمة")));
    } on Exception {
      emit(const BannerState.error("حدث خطأ اثناء حضف الصورة القديمة"));
    }
  }

  Future<String?> uploadImageGetUrl(Uint8List? imgBytes) async {
    try {
      if (imgBytes != null) {
        Reference ref = storage.ref().child("${uuid.v1()}.png");
        UploadTask uploadTask =
            ref.putData(imgBytes, SettableMetadata(contentType: 'image/png'));
        TaskSnapshot taskSnapshot = await uploadTask;

        String imageUri = await taskSnapshot.ref
            .getDownloadURL()
            .onError((error, stackTrace) {
          emit(const BannerState.error("خطأ اثناء رفع الصورة"));
          // ignore: null_argument_to_non_null_type
          return Future.value(null);
        });
        return imageUri;
      }
      return null;
    } on Exception catch (error) {
      debugPrint(error.toString());
      emit(const BannerState.error(""));
      return null;
    }
  }

  void uploadChanges(
      Tuple3<List<Poster>, List<Poster>, List<Poster>> posters) async {
    try {
      emit(const BannerState.loading());
      Map<String, dynamic> changesMap = _mapEntries(posters);
      CollectionReference collection = firestore.collection('banners');
      DocumentReference document = collection.doc('home');
      await document
          .set(changesMap)
          .whenComplete(() => emit(BannerState.saved(posters)))
          .onError((error, stackTrace) =>
              emit(const BannerState.error("خطأ اثناء رفع التعديلات")));
      emit(BannerState.saved(posters));
    } on Exception {
      emit(const BannerState.error("خطأ اثناء رفع التعديلات"));
    }
  }

  Map<String, dynamic> _mapEntries(
      Tuple3<List<Poster>, List<Poster>, List<Poster>> posters) {
    Map<String, dynamic> map = {
      "huge": [
        for (var poster in posters.value1)
          {
            "route": {
              "category": poster.routeType == RouteType.category
                  ? poster.routeId
                  : null,
              "product":
                  poster.routeType == RouteType.product ? poster.routeId : null,
              "collection": poster.routeType == RouteType.collection
                  ? poster.routeId
                  : null
            },
            "url": poster.mediaUrl
          }
      ],
      "snaplist": [
        for (var poster in posters.value3)
          {
            "route": {
              "category": poster.routeType == RouteType.category
                  ? poster.routeId
                  : null,
              "product":
                  poster.routeType == RouteType.product ? poster.routeId : null,
              "collection": poster.routeType == RouteType.collection
                  ? poster.routeId
                  : null
            },
            "url": poster.mediaUrl
          }
      ],
      "wall": [
        for (var poster in posters.value2)
          {
            "route": {
              "category": poster.routeType == RouteType.category
                  ? poster.routeId
                  : null,
              "product":
                  poster.routeType == RouteType.product ? poster.routeId : null,
              "collection": poster.routeType == RouteType.collection
                  ? poster.routeId
                  : null
            },
            "url": poster.mediaUrl
          }
      ]
    };
    return map;
  }
}
