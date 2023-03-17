// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saleor_app_flutter/features/storefront/domain/entities/product.dart';

class CheckoutLine {
  String id;
  int quantity;
  String variantId;
  String variantName;
  Product product;
  String currency;
  double unitPrice;
  double undiscountedPrice;
  double totalPrice;
  CheckoutLine({
    required this.id,
    required this.quantity,
    required this.variantId,
    required this.variantName,
    required this.product,
    required this.currency,
    required this.unitPrice,
    required this.undiscountedPrice,
    required this.totalPrice,
  });

  @override
  String toString() {
    return 'CheckoutLine(id: $id, quantity: $quantity, variantId: $variantId, variantName: $variantName, product: $product, currency: $currency, unitPrice: $unitPrice, undiscountedPrice: $undiscountedPrice, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(covariant CheckoutLine other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.quantity == quantity &&
      other.variantId == variantId &&
      other.variantName == variantName &&
      other.product == product &&
      other.currency == currency &&
      other.unitPrice == unitPrice &&
      other.undiscountedPrice == undiscountedPrice &&
      other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      quantity.hashCode ^
      variantId.hashCode ^
      variantName.hashCode ^
      product.hashCode ^
      currency.hashCode ^
      unitPrice.hashCode ^
      undiscountedPrice.hashCode ^
      totalPrice.hashCode;
  }
}
