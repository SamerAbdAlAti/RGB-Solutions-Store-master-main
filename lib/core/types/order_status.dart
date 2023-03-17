// ignore_for_file: constant_identifier_names

enum OrderStatus {
  DRAFT,
  UNCONFIRMED,
  UNFULFILLED,
  PARTIALLY_FULFILLED,
  PARTIALLY_RETURNED,
  RETURNED,
  FULFILLED,
  CANCELED;

  String toJson() => name;
  static OrderStatus fromJson(String json) => values.byName(json);
}
