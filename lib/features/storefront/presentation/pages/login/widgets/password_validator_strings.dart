import 'package:flutter_pw_validator/Resource/Strings.dart';

class ArabicString implements FlutterPwValidatorStrings {
  @override
  String get atLeast => "على الأقل - خانات";

  @override
  String get normalLetters => "- أحرف";

  @override
  String get numericCharacters => "- أرقام";

  @override
  String get specialCharacters => "- رموز";

  @override
  String get uppercaseLetters => "- حرف كبير";
}
