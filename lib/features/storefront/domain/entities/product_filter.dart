// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saleor_app_flutter/core/types/filter_by.dart';
import 'package:saleor_app_flutter/core/types/filter_direction.dart';

class ProductFilter {
  FilterDirection direction;
  FilterBy fields;
  double greaterThan;
  double lowerThan;
  ProductFilter({
    required this.direction,
    required this.fields,
    required this.greaterThan,
    required this.lowerThan,
  });

  @override
  bool operator ==(covariant ProductFilter other) {
    if (identical(this, other)) return true;

    return other.direction == direction &&
        other.fields == fields &&
        other.greaterThan == greaterThan &&
        other.lowerThan == lowerThan;
  }

  @override
  int get hashCode {
    return direction.hashCode ^
        fields.hashCode ^
        greaterThan.hashCode ^
        lowerThan.hashCode;
  }

  @override
  String toString() {
    return 'ProductFilter(direction: $direction, fields: $fields, greaterThan: $greaterThan, lowerThan: $lowerThan)';
  }
}
