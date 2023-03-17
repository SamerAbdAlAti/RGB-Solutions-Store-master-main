import 'dart:convert';

class Review {
  //TODO: EXTEND TO MODEL FOR USE IN SEPERATE REPO
  String id;
  String firstName;
  String lastName;
  String userId;
  String userEmail;
  String userPhone;
  String reviewText;
  String created;
  double rating;
  Review({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.userEmail,
    required this.userPhone,
    required this.reviewText,
    required this.created,
    required this.rating,
  });

  Review copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userId,
    String? userEmail,
    String? userPhone,
    String? reviewText,
    String? created,
    double? rating,
  }) {
    return Review(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userPhone: userPhone ?? this.userPhone,
      reviewText: reviewText ?? this.reviewText,
      created: created ?? this.created,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userId': userId,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'reviewText': reviewText,
      'created': created,
      'rating': rating,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      id: map['id'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      userId: map['userId'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userPhone: map['userPhone'] ?? '',
      reviewText: map['reviewText'] ?? '',
      created: map['created'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Review(id: $id, firstName: $firstName, lastName: $lastName, userId: $userId, userEmail: $userEmail, userPhone: $userPhone, reviewText: $reviewText, created: $created, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Review &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.userId == userId &&
        other.userEmail == userEmail &&
        other.userPhone == userPhone &&
        other.reviewText == reviewText &&
        other.created == created &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        userId.hashCode ^
        userEmail.hashCode ^
        userPhone.hashCode ^
        reviewText.hashCode ^
        created.hashCode ^
        rating.hashCode;
  }
}
