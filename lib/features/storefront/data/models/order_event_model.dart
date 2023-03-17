import 'dart:convert';
import 'package:saleor_app_flutter/core/types/order_events.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/order_event.dart';

class OrderEventModel extends OrderEvent {
  OrderEventModel(
      {required super.id,
      required super.date,
      required super.type,
      required super.message});

  OrderEvent copyWith({
    String? id,
    String? date,
    OrderEventEnum? type,
    String? message,
  }) {
    return OrderEvent(
      id: id ?? this.id,
      date: date ?? this.date,
      type: type ?? this.type,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'type': type.toJson(),
      'message': message,
    };
  }

  factory OrderEventModel.fromMap(Map<String, dynamic> map) {
    return OrderEventModel(
      id: map['id'] as String,
      date: map['date'] as String,
      type: OrderEventEnum.fromJson(map['type']),
      message: map['message'] != null ? map['message'] as String : '',
    );
  }

  factory OrderEventModel.fromStoredMap(Map<String, dynamic> map) {
    return OrderEventModel(
      id: map['id'] as String,
      date: map['date'] as String,
      type: OrderEventEnum.fromJson(map['type']),
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderEventModel.fromJson(String source) =>
      OrderEventModel.fromStoredMap(
          json.decode(source) as Map<String, dynamic>);

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
