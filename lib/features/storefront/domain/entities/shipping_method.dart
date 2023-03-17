// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShippingMethod {
  String id;
  String name;
  String? description;
  double price;
  String currency;
  int? maximumDeliveryDays;
  int? minimumDeliveryDays;
  ShippingMethod({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.currency,
    this.maximumDeliveryDays,
    this.minimumDeliveryDays,
  });

  @override
  String toString() {
    return 'ShippingMethod(id: $id, name: $name, description: $description, price: $price, currency: $currency, maximumDeliveryDays: $maximumDeliveryDays, minimumDeliveryDays: $minimumDeliveryDays)';
  }

  @override
  bool operator ==(covariant ShippingMethod other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.currency == currency &&
        other.maximumDeliveryDays == maximumDeliveryDays &&
        other.minimumDeliveryDays == minimumDeliveryDays;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        currency.hashCode ^
        maximumDeliveryDays.hashCode ^
        minimumDeliveryDays.hashCode;
  }
}
