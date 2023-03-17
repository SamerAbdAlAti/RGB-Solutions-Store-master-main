import 'package:collection/collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/utl/phone_converter.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/review.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../domain/entities/user.dart';

part 'review_cubit.freezed.dart';
part 'review_state.dart';

//TODO: PUT INTO A REPO AND A DATA SOURCE

class ReviewCubit extends Cubit<ReviewState> {
  final Future<User?> Function() userFetch;
  ReviewCubit(this.userFetch) : super(const ReviewState.initial());

  final FirebaseDatabase database = FirebaseDatabase.instance;

  final _uploadReviewErrorMsg = "حدث خطأ اثناء رفع التقيم";
  final _getReviewsErrorMsg = "حدث خطأ اثناء طلب التقيمات لهذا المنتج";
  final _idGen = const Uuid();
  final _phoneConverer = PhoneConverter();

  putAReview(String message, double rating, Product product) async {
    try {
      emit(const ReviewState.loading());
      final user = await userFetch();
      final ref = database
          .ref()
          .child("reviews")
          .child("products")
          .child(product.id)
          .push();

      await ref.set({
        "review": {
          'id': ref.key,
          'firstName': user!.firstName,
          'lastName': user.lastName,
          'userId': user.id,
          'userPhone': _phoneConverer.toPhone(user.email),
          'reviewText': message,
          'created': DateTime.now().toIso8601String(),
          'rating': rating,
        }
      }).onError((error, stackTrace) =>
          throw InformationException(message: _uploadReviewErrorMsg));
      final reviews = await _updatedReviewList(product);
      final avgRating = calculateAvgRating(reviews);
      emit(ReviewState.loaded(user, reviews, avgRating));
    } on Exception {
      emit(ReviewState.error(_uploadReviewErrorMsg));
      return [];
    }
  }

  getProductReviews(Product product) async {
    try {
      emit(const ReviewState.loading());
      final user = await userFetch();
      final snapshot = await database
          .ref()
          .child("reviews")
          .child("products")
          .child(product.id)
          .get();
      var reviews = snapshot.children
          .map((e) => Review.fromMap((e.value as Map)['review']))
          .toList();

      final avg = calculateAvgRating(reviews);
      emit(ReviewState.loaded(user, reviews, avg));
    } on Exception {
      emit(ReviewState.error(_getReviewsErrorMsg));
    }
  }

  removeReviews(Product product, List<Review> reviews, int index) async {
    try {
      emit(const ReviewState.loading());
      final user = await userFetch();
      List<Review> modifiableReviews = [];
      for (var element in reviews) {
        modifiableReviews.add(element);
      }
      await database
          .ref()
          .child("reviews")
          .child("products")
          .child(product.id)
          .child(modifiableReviews[index].id)
          .remove();
      modifiableReviews.removeAt(index);
      final avg = calculateAvgRating(modifiableReviews);
      emit(ReviewState.loaded(user, modifiableReviews, avg));
    } on Exception {
      emit(ReviewState.error(_getReviewsErrorMsg));
    }
  }

  _updatedReviewList(Product product) async {
    try {
      final reviews = await database
          .ref()
          .child("reviews")
          .child("products")
          .child(product.id)
          .get()
          .onError((error, stackTrace) {
        throw InformationException(message: _getReviewsErrorMsg);
      }).then((value) => value.children
              .map((e) => Review.fromMap((e.value as Map)['review']))
              .toList());
      return reviews;
    } on Exception {
      emit(ReviewState.error(_getReviewsErrorMsg));
      return [];
    }
  }

  double calculateAvgRating(List<Review> reviews) {
    double total = 0;
    for (var element in reviews) {
      total += element.rating;
    }
    double result = (total / reviews.length);
    return result.isNaN ? 0 : result;
  }

  bool showReviewSection(Product product, List<Review> reviews, User? user) {
    bool isIt = false;
    if (user != null) {
      if (reviews.firstWhereOrNull((element) => element.userId == user.id) ==
          null) {
        final orders = user.orders;
        if (orders.isNotEmpty) {
          for (var order in orders) {
            for (var orderLine in order.lines) {
              for (var element in product.variants) {
                if (element.id == orderLine.productVariantId) {
                  isIt = true;
                }
              }
            }
          }
        }
      }
    }
    return isIt;
  }
}
