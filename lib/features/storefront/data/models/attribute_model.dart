import 'dart:convert';

import '../../domain/entities/attribute.dart';

class AttributeModel extends Attribute {
  AttributeModel(
      {required super.id,
      required super.name,
      required super.slug,
      super.unit});

  @override
  String toString() {
    return 'Attribute(id: $id, name: $name, slug: $slug, unit: $unit)';
  }

  AttributeModel copyWith({
    String? id,
    String? name,
    String? slug,
    String? unit,
  }) {
    return AttributeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'unit': unit,
    };
  }

  factory AttributeModel.fromMap(Map<String, dynamic> map) {
    return AttributeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      unit: map['unit'],
    );
  }

  factory AttributeModel.fromStoredMap(Map<String, dynamic> map) {
    return AttributeModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      unit: map['unit'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AttributeModel.fromJson(String source) =>
      AttributeModel.fromStoredMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AttributeModel &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.unit == unit;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ slug.hashCode ^ unit.hashCode;
  }
}
