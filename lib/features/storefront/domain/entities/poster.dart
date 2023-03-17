// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saleor_app_flutter/core/types/route_type.dart';

class Poster {
  String routeId;
  RouteType routeType;
  String mediaUrl;
  Poster({
    required this.routeId,
    required this.routeType,
    required this.mediaUrl,
  });

  @override
  bool operator ==(covariant Poster other) {
    if (identical(this, other)) return true;
  
    return 
      other.routeId == routeId &&
      other.routeType == routeType &&
      other.mediaUrl == mediaUrl;
  }

  @override
  int get hashCode => routeId.hashCode ^ routeType.hashCode ^ mediaUrl.hashCode;
}
