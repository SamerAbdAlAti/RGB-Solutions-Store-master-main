// ignore_for_file: constant_identifier_names

enum AttributeInputTypeEnum {
  DROPDOWN,
  MULTISELECT,
  FILE,
  REFERENCE,
  NUMERIC,
  RICH_TEXT,
  PLAIN_TEXT,
  SWATCH,
  BOOLEAN,
  DATE,
  DATE_TIME;

  String toJson() => name;
  static AttributeInputTypeEnum fromJson(String json) => values.byName(json);
}
