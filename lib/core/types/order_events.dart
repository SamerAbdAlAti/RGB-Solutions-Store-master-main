// ignore_for_file: constant_identifier_names

enum OrderEventEnum {
  DRAFT_CREATED,
  DRAFT_CREATED_FROM_REPLACE,
  ADDED_PRODUCTS,
  REMOVED_PRODUCTS,
  PLACED,
  PLACED_FROM_DRAFT,
  OVERSOLD_ITEMS,
  CANCELED,
  ORDER_MARKED_AS_PAID,
  ORDER_FULLY_PAID,
  ORDER_REPLACEMENT_CREATED,
  ORDER_DISCOUNT_ADDED,
  ORDER_DISCOUNT_AUTOMATICALLY_UPDATED,
  ORDER_DISCOUNT_UPDATED,
  ORDER_DISCOUNT_DELETED,
  ORDER_LINE_DISCOUNT_UPDATED,
  ORDER_LINE_DISCOUNT_REMOVED,
  ORDER_LINE_PRODUCT_DELETED,
  ORDER_LINE_VARIANT_DELETED,
  UPDATED_ADDRESS,
  EMAIL_SENT,
  CONFIRMED,
  PAYMENT_AUTHORIZED,
  PAYMENT_CAPTURED,
  EXTERNAL_SERVICE_NOTIFICATION,
  PAYMENT_REFUNDED,
  PAYMENT_VOIDED,
  PAYMENT_FAILED,
  TRANSACTION_EVENT,
  TRANSACTION_CAPTURE_REQUESTED,
  TRANSACTION_REFUND_REQUESTED,
  TRANSACTION_VOID_REQUESTED,
  INVOICE_REQUESTED,
  INVOICE_GENERATED,
  INVOICE_UPDATED,
  INVOICE_SENT,
  FULFILLMENT_CANCELED,
  FULFILLMENT_RESTOCKED_ITEMS,
  FULFILLMENT_FULFILLED_ITEMS,
  FULFILLMENT_REFUNDED,
  FULFILLMENT_RETURNED,
  FULFILLMENT_REPLACED,
  FULFILLMENT_AWAITS_APPROVAL,
  TRACKING_UPDATED,
  NOTE_ADDED,
  OTHER;

  String toJson() => name;
  static OrderEventEnum fromJson(String json) => values.byName(json);
}
