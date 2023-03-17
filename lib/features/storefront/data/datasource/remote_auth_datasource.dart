// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:graphql_flutter/graphql_flutter.dart' hide ServerException;
import 'package:injectable/injectable.dart';
import 'package:saleor_app_flutter/core/error/exceptions.dart';
import 'package:saleor_app_flutter/core/graphql/auth_mutations.dart';
import 'package:saleor_app_flutter/core/utl/secrets.dart';
import 'package:saleor_app_flutter/features/storefront/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<Map<String, dynamic>> getToken(
      {required String email, required String password});
  Future<UserModel> refreshToken({required String refreshToken});
  Future<UserModel> getUserData(
      {required String token,
      required String refreshToken,
      required String email});
  Future<void> activateAccount({required String id});
  Future<UserModel> forcedUserData({required String email});
  Future<UserModel> createUser(
      {required String email,
      required String password,
      required String firstName,
      required String lastName});
  Future<bool> checkIfUserExist(
      {required String email, required String password});
  Future<bool> isTokenValid({required String token});
}

@LazySingleton(as: AuthRemoteDatasource)
class IAuthDatasource implements AuthRemoteDatasource {
  IAuthDatasource(this._standardClient);
  final GraphQLClient _standardClient;

  final _superClient = GraphQLClient(
      link: Constants.authLink, cache: GraphQLCache(store: InMemoryStore()));

  @override
  Future<void> activateAccount({required String id}) async {
    try {
      QueryResult<Object?> result = await _superClient.mutate(
        MutationOptions(
          document: AuthMutations.activateUser,
          variables: {"id": id},
        ),
      );
      if (result.data == null) {
        throw InformationException(message: "لايوجد مستخدم بهذا التعريف.");
      }
    } on InformationException catch (error) {
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException(message: "حدث خطأ في الخادم.");
    }
  }

  @override
  Future<Map<String, dynamic>> getToken(
      {required String email, required String password}) async {
    try {
      final result = await _standardClient.mutate(
        MutationOptions(
          document: AuthMutations.createToken,
          variables: {'email': email, 'password': password},
        ),
      );
      if (result.data!['tokenCreate']['token'] == null) {
        throw InformationException(message: "المعلومات غير صحيحة.");
      }
      return result.data!['tokenCreate'];
    } on InformationException catch (error) {
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> getUserData(
      {required String token,
      required String refreshToken,
      required String email}) async {
    try {
      QueryResult<Object?> result = await _superClient.mutate(
        MutationOptions(
            document: AuthMutations.forcedUserData,
            variables: {"email": email}),
      );
      // if (result.data!['me'] == null) {
      //   throw InformationException(
      //       message: "الشفرة المعطاه غير صالحة، يرجى إعادة تسجيل الدخول.");
      // }
      if (result.data!['user'] == null) {
        throw InformationException(message: "رقم الهاتف خاطئ.");
      }
      Map<String, dynamic> tokenMap = {
        'token': token,
        'refreshToken': refreshToken
      };
      // 'user' was 'me' & no email var
      result.data!['user'].addEntries(tokenMap.entries);
      return UserModel.fromMap(result.data!['user']);
    } on InformationException catch (error) {
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> forcedUserData({required String email}) async {
    try {
      QueryResult<Object?> result = await _superClient.mutate(
        MutationOptions(
          document: AuthMutations.forcedUserData,
          variables: {'email': email},
        ),
      );
      if (result.data!['user'] == null) {
        throw InformationException(message: "رقم الهاتف خاطئ.");
      }
      return UserModel.fromMap(result.data!['user']);
    } on InformationException catch (error) {
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> refreshToken({required String refreshToken}) async {
    try {
      QueryResult<Object?> result = await _superClient.mutate(
        MutationOptions(
          document: AuthMutations.refreashToken,
          variables: {'refreshToken': refreshToken},
        ),
      );
      if (result.data!['tokenRefresh']['token'] == null) {
        throw InformationException(message: "يرجى إعادة تسجيل الدخول.");
      }
      Map<String, dynamic> tokenMap = {
        'token': result.data!['tokenRefresh']['token'],
        'refreshToken': refreshToken
      };
      result.data!['tokenRefresh']['user'].addEntries(tokenMap.entries);
      return UserModel.fromMap(result.data!['tokenRefresh']['user']);
    } on InformationException catch (error) {
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> createUser(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      QueryResult<Object?> result = await _standardClient.mutate(
        MutationOptions(
          document: AuthMutations.registerUser,
          variables: {
            'email': email,
            'password': password,
            'firstName': firstName,
            'lastName': lastName
          },
        ),
      );
      if (result.data!['accountRegister']['user'] == null) {
        throw InformationException(message: 'يوجد مستخدم بهذه البيانات.');
      }
      await activateAccount(id: result.data!['accountRegister']['user']['id']);
      final tokenMap = await getToken(email: email, password: password);
      result.data!['accountRegister']['user'].addEntries(tokenMap.entries);
      UserModel userModel =
          UserModel.fromMap(result.data!['accountRegister']['user']);
      return userModel;
    } on InformationException catch (error) {
      throw InformationException(message: error.message);
    } on Exception {
      throw ServerException();
    }
  }

  @override
  Future<bool> checkIfUserExist(
      {required String email, required String password}) async {
    QueryResult<Object?> result = await _superClient.query(
      QueryOptions(
        document: AuthMutations.forcedUserData,
        variables: {'email': email},
      ),
    );
    if (result.data!['user'] == null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> isTokenValid({required String token}) async {
    final result = await _standardClient.mutate(MutationOptions(
        document: AuthMutations.isValidToken, variables: {"token": token}));
    return result.data?['tokenVerify']['isValid'];
  }
}
