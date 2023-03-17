// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:saleor_app_flutter/core/types/order_events.dart';

class OrderEvent {
  String id;
  String date;
  OrderEventEnum type;
  String message;
  OrderEvent({
    required this.id,
    required this.date,
    required this.type,
    required this.message,
  });

  @override
  String toString() {
    return 'OrderEvent(id: $id, date: $date, type: $type, message: $message)';
  }

  @override
  bool operator ==(covariant OrderEvent other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.type == type &&
        other.message == message;
  }

  @override
  int get hashCode {
    return id.hashCode ^ date.hashCode ^ type.hashCode ^ message.hashCode;
  }
}
