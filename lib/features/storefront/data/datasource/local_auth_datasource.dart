import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthLocalDatasource {
  Future<UserModel?> getStoredUser();
  Future<void> saveUserData(String user);
  Future<void> deleteUserData();
}

@LazySingleton(as: AuthLocalDatasource)
class IAuthLocalDatasource implements AuthLocalDatasource {
  final FlutterSecureStorage storage;

  IAuthLocalDatasource(this.storage);

  @override
  Future<void> deleteUserData() async {
    try {
      await storage.delete(key: 'user');
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<UserModel?> getStoredUser() async {
    try {
      final json = await storage.read(key: 'user');
      if (json != null) {
        return UserModel.fromJson(json);
      } else {
        return null;
      }
    } catch (error) {
      throw StorageNotFoundException();
    }
  }

  @override
  Future<void> saveUserData(String user) async {
    try {
      await storage.delete(key: 'user');
      await storage.write(key: 'user', value: user);
    } on Error {
      throw CacheException();
    }
  }
}
