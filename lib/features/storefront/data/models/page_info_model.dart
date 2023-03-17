// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:saleor_app_flutter/features/storefront/domain/entities/page_info.dart';

class PageInfoModel extends PageInfo {
  PageInfoModel({
    required super.totalCount,
    required super.hasNextPage,
    required super.hasPreviousPage,
    required super.startCursor,
    required super.endCursor,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalCount': totalCount,
      'hasNextPage': hasNextPage,
      'hasPreviousPage': hasPreviousPage,
      'startCursor': startCursor,
      'endCursor': endCursor,
    };
  }

  PageInfoModel copyWith({
    int? totalCount,
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
  }) {
    return PageInfoModel(
      totalCount: totalCount ?? this.totalCount,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      startCursor: startCursor ?? this.startCursor,
      endCursor: endCursor ?? this.endCursor,
    );
  }

  factory PageInfoModel.fromMap(Map<String, dynamic> map) {
    return PageInfoModel(
      totalCount: map['totalCount'] as int,
      hasNextPage: map['pageInfo']['hasNextPage'] as bool,
      hasPreviousPage: map['pageInfo']['hasPreviousPage'] as bool,
      startCursor: map['pageInfo']['startCursor'] != null
          ? map['pageInfo']['startCursor'] as String
          : '',
      endCursor: map['pageInfo']['endCursor'] != null
          ? map['pageInfo']['endCursor'] as String
          : '',
    );
  }
  factory PageInfoModel.fromStoredMap(Map<String, dynamic> map) {
    return PageInfoModel(
      totalCount: map['totalCount'] as int,
      hasNextPage: map['hasNextPage'] as bool,
      hasPreviousPage: map['hasPreviousPage'] as bool,
      startCursor: map['startCursor'] as String,
      endCursor: map['endCursor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PageInfoModel.fromJson(String source) =>
      PageInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PageInfoModel(totalCount: $totalCount, hasNextPage: $hasNextPage, hasPreviousPage: $hasPreviousPage, startCursor: $startCursor, endCursor: $endCursor)';
  }

  @override
  bool operator ==(covariant PageInfoModel other) {
    if (identical(this, other)) return true;

    return other.totalCount == totalCount &&
        other.hasNextPage == hasNextPage &&
        other.hasPreviousPage == hasPreviousPage &&
        other.startCursor == startCursor &&
        other.endCursor == endCursor;
  }

  @override
  int get hashCode {
    return totalCount.hashCode ^
        hasNextPage.hashCode ^
        hasPreviousPage.hashCode ^
        startCursor.hashCode ^
        endCursor.hashCode;
  }
}
