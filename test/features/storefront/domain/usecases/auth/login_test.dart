import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:saleor_app_flutter/features/storefront/domain/entities/user.dart';
import 'package:saleor_app_flutter/features/storefront/domain/repositories/auth_repository.dart';

import 'login_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository repository;
  late String tEmail;
  late String tPass;
  late User tUser;

  setUp(() {});
}
