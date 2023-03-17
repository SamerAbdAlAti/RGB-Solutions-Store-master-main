import 'package:saleor_app_flutter/core/types/attribute_input_type_enum.dart';

class AttributeValue {
  String id;
  String name;
  String value;
  AttributeInputTypeEnum inputType;
  String slug;
  String? reference;
  bool? boolean;
  String? richText;
  String? plainText;
  AttributeValue({
    required this.id,
    required this.name,
    required this.value,
    required this.inputType,
    required this.slug,
    this.reference,
    this.boolean,
    this.richText,
    this.plainText,
  });
}
