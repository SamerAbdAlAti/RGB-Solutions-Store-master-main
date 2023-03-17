// ignore_for_file: public_member_api_docs, sort_constructors_first
class Address {
  String id;
  String firstName;
  String lastName;
  String streetAddress1;
  String streetAddress2;
  String city;
  String cityArea;
  String postalCode;
  String country;
  Address({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.streetAddress1,
    required this.streetAddress2,
    required this.city,
    required this.cityArea,
    required this.postalCode,
    required this.country,
  });

  @override
  String toString() {
    return 'Address(id: $id, firstName: $firstName, lastName: $lastName, streetAddress1: $streetAddress1, streetAddress2: $streetAddress2, city: $city, cityArea: $cityArea, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(covariant Address other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.streetAddress1 == streetAddress1 &&
      other.streetAddress2 == streetAddress2 &&
      other.city == city &&
      other.cityArea == cityArea &&
      other.postalCode == postalCode &&
      other.country == country;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      streetAddress1.hashCode ^
      streetAddress2.hashCode ^
      city.hashCode ^
      cityArea.hashCode ^
      postalCode.hashCode ^
      country.hashCode;
  }
}
