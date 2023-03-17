
class Attribute {
  String id;
  String name;
  String slug;
  String? unit;
  Attribute({
    required this.id,
    required this.name,
    required this.slug,
    this.unit,
  });


  @override
  String toString() {
    return 'Attribute(id: $id, name: $name, slug: $slug, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Attribute &&
      other.id == id &&
      other.name == name &&
      other.slug == slug &&
      other.unit == unit;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      slug.hashCode ^
      unit.hashCode;
  }
}
