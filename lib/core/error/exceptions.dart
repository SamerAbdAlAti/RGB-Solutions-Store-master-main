// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerException implements Exception {
  String? message;
  ServerException({this.message});
}

class CacheException implements Exception {
  String? message;
  CacheException({this.message});
}

class InformationException implements Exception {
  String message;
  InformationException({required this.message});
}

class UnexpectedException implements Exception {
  String? message;
  UnexpectedException({this.message});
}

class StorageNotFoundException implements Exception {
  String? message;
  StorageNotFoundException({this.message});
}
