// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:saleor_app_flutter/features/storefront/domain/entities/address.dart';

class AddressModel extends Address {
  AddressModel(
      {required super.id,
        required super.firstName,
        required super.lastName,
        required super.streetAddress1,
        required super.streetAddress2,
        required super.city,
        required super.postalCode,
        required super.cityArea,
        required super.country});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'streetAddress1': streetAddress1,
      'streetAddress2': streetAddress2,
      'cityArea': cityArea,
      'city': city,
      'postalCode': postalCode,
      'country': country
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map.containsKey('id') ? map['id'] as String : '',
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      streetAddress1: map['streetAddress1'] as String,
      streetAddress2:
      map['streetAddress2'] != null ? map['streetAddress2'] as String : '',
      cityArea: map['cityArea'] != null ? map['cityArea'] as String : '',
      city: map['city'] as String,
      postalCode: map['postalCode'] as String,
      country: map['country']['country'] as String,
    );
  }

  factory AddressModel.fromStoredMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map.containsKey('id') ? map['id'] as String : '',
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      streetAddress1: map['streetAddress1'] as String,
      streetAddress2:
      map['streetAddress2'] != null ? map['streetAddress2'] as String : '',
      cityArea: map['cityArea'] != null ? map['cityArea'] as String : '',
      city: map['city'] as String,
      postalCode: map['postalCode'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromStoredMap(json.decode(source) as Map<String, dynamic>);
  @override
  String toString() {
    return 'Address(id: $id, firstName: $firstName, lastName: $lastName, streetAddress1: $streetAddress1, streetAddress2: $streetAddress2, city: $city, cityArea: $cityArea, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.streetAddress1 == streetAddress1 &&
        other.streetAddress2 == streetAddress2 &&
        other.city == city &&
        other.cityArea == cityArea &&
        other.postalCode == postalCode &&
        other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    firstName.hashCode ^
    lastName.hashCode ^
    streetAddress1.hashCode ^
    streetAddress2.hashCode ^
    city.hashCode ^
    cityArea.hashCode ^
    postalCode.hashCode ^
    country.hashCode;
  }
}
