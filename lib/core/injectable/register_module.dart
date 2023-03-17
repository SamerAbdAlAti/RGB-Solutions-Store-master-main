import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import '../utl/secrets.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  InternetConnectionCheckerPlus get connectionChecker =>
      InternetConnectionCheckerPlus();

  @lazySingleton
  GraphQLClient get gqlClient => GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()), link: Constants.apiLink);

  @lazySingleton
  FirebaseFirestore get firestoreInstance => FirebaseFirestore.instance;

  @lazySingleton
  FlutterSecureStorage get secureStorageInstance =>
      const FlutterSecureStorage();
}
