// ignore_for_file: constant_identifier_names

enum PaymentChargeStatusEnum {
  NOT_CHARGED,
  PENDING,
  PARTIALLY_CHARGED,
  FULLY_CHARGED,
  PARTIALLY_REFUNDED,
  FULLY_REFUNDED,
  REFUSED,
  CANCELLED;

  String toJson() => name;
  static PaymentChargeStatusEnum fromJson(String json) => values.byName(json);
}
