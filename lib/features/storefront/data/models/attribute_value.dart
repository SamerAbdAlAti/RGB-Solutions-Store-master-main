import 'dart:convert';

import '../../../../core/types/attribute_input_type_enum.dart';
import '../../domain/entities/attribute_value.dart';

class AttributeValueModel extends AttributeValue {
  AttributeValueModel(
      {required super.id,
      required super.name,
      required super.value,
      required super.inputType,
      required super.slug,
      super.boolean,
      super.plainText,
      super.reference,
      super.richText});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
      'inputType': inputType.toJson(),
      'slug': slug,
      'reference': reference,
      'boolean': boolean,
      'richText': richText,
      'plainText': plainText,
    };
  }

  factory AttributeValueModel.fromMap(Map<String, dynamic> map) {
    return AttributeValueModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      value: map['value'] ?? '',
      inputType: AttributeInputTypeEnum.fromJson(map['inputType']),
      slug: map['slug'] ?? '',
      reference: map['reference'],
      boolean: map['boolean'],
      richText: map['richText'],
      plainText: map['plainText'],
    );
  }

  factory AttributeValueModel.fromStoredMap(Map<String, dynamic> map) {
    return AttributeValueModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      value: map['value'] ?? '',
      inputType: AttributeInputTypeEnum.fromJson(map['inputType']),
      slug: map['slug'] ?? '',
      reference: map['reference'],
      boolean: map['boolean'],
      richText: map['richText'],
      plainText: map['plainText'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AttributeValueModel.fromJson(String source) =>
      AttributeValueModel.fromStoredMap(json.decode(source));

  @override
  String toString() {
    return 'AttributeValue(id: $id, name: $name, value: $value, inputType: $inputType, slug: $slug, reference: $reference, boolean: $boolean, richText: $richText, plainText: $plainText)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AttributeValueModel &&
        other.id == id &&
        other.name == name &&
        other.value == value &&
        other.inputType == inputType &&
        other.slug == slug &&
        other.reference == reference &&
        other.boolean == boolean &&
        other.richText == richText &&
        other.plainText == plainText;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        value.hashCode ^
        inputType.hashCode ^
        slug.hashCode ^
        reference.hashCode ^
        boolean.hashCode ^
        richText.hashCode ^
        plainText.hashCode;
  }
}
