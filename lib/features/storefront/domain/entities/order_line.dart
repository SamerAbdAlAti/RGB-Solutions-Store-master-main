// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderLine {
  String id;
  String productName;
  String productVariantId;
  int quantity;
  String thumbnail;
  String currency;
  double unitPrice;
  double totalPrice;
  OrderLine({
    required this.id,
    required this.productName,
    required this.productVariantId,
    required this.quantity,
    required this.thumbnail,
    required this.currency,
    required this.unitPrice,
    required this.totalPrice,
  });

  @override
  String toString() {
    return 'OrderLine(id: $id, productName: $productName, productVariantId: $productVariantId, quantity: $quantity, thumbnail: $thumbnail, currency: $currency, unitPrice: $unitPrice, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(covariant OrderLine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productName == productName &&
        other.productVariantId == productVariantId &&
        other.quantity == quantity &&
        other.thumbnail == thumbnail &&
        other.currency == currency &&
        other.unitPrice == unitPrice &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productName.hashCode ^
        productVariantId.hashCode ^
        quantity.hashCode ^
        thumbnail.hashCode ^
        currency.hashCode ^
        unitPrice.hashCode ^
        totalPrice.hashCode;
  }
}
