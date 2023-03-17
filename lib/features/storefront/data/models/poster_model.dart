// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saleor_app_flutter/core/types/route_type.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/poster.dart';

class PosterModel extends Poster {
  PosterModel(
      {required super.routeId,
      required super.routeType,
      required super.mediaUrl});

  @override
  bool operator ==(covariant PosterModel other) {
    if (identical(this, other)) return true;

    return other.routeId == routeId &&
        other.routeType == routeType &&
        other.mediaUrl == mediaUrl;
  }

  @override
  int get hashCode => routeId.hashCode ^ routeType.hashCode ^ mediaUrl.hashCode;

  @override
  String toString() =>
      'PosterModel(routeId: $routeId, routeType: $routeType, mediaUrls: $mediaUrl)';

  factory PosterModel.fromMap(Map<String, dynamic> map) {
    late RouteType routeType;
    String routeId = "";
    if (map['route']['category'] != null) {
      routeType = RouteType.category;
      routeId = map['route']['category'];
    } else if (map['route']['product'] != null) {
      routeType = RouteType.product;
      routeId = map['route']['product'];
    } else if (map['route']['collection'] != null) {
      routeType = RouteType.collection;
      routeId = map['route']['collection'];
    } else {
      routeType = RouteType.unclickable;
      routeId = '';
    }
    return PosterModel(
      routeId: routeId,
      routeType: routeType,
      mediaUrl: map['url'],
    );
  }
}
