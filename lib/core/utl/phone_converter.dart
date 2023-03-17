import 'package:injectable/injectable.dart';

@lazySingleton
class PhoneConverter {
  String toEmail(String phoneNumber) {
    String email = phoneNumber.replaceAll('+', '');
    email = "$email@phone.com";
    return email;
  } 

  String toPhone(String email) {
    String phone = email.substring(0, email.indexOf('@'));
    phone = "+$phone";
    return phone;
  } 
}
