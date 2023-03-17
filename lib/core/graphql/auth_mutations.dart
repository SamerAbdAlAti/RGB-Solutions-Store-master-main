import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:saleor_app_flutter/core/graphql/fragments.dart';

// App Token mw9OTdf7YoynlOq8vtq7VnM5HEoIkW
// String.fromEnviroment('APP_TOKEN')

class AuthMutations {
  static final createToken = gql(r'''
mutation createToken($email: String!, $password: String!) {
  tokenCreate(email: $email, password: $password) {
    token
    refreshToken
    csrfToken
  }
}
''');

  static final refreashToken = gql('''
mutation RefreshToken(\$refreshToken: String!) {
  tokenRefresh(refreshToken: \$refreshToken) {
    token
    user {
      ...userData
    }
  }
}
${Fragments.userFields}
''');

  /// This mutation will use the app token to get user data
  static final forcedUserData = gql('''
query forceUserData(\$email:String!) {
  user(email: \$email) {
    ...userData
  }
}

${Fragments.userFields}
''');

  /// This Query Requires the User Token
  static final getUserData = gql('''
{
  me {
    ...userData
  }
}
${Fragments.userFields}
''');

  static final activateUser = gql('''
mutation activateAccount(\$id: ID!) {
  customerUpdate(input: {isActive: true}, id: \$id) {
    errors{
      message
      code
    }
    user {
      id
    }
  }
}
''');
  static final registerUser = gql('''
mutation RegisterAccount(\$firstName: String!, \$lastName: String!, \$email: String!, \$password: String!) {
  accountRegister(
    input: {firstName: \$firstName, lastName: \$lastName, email: \$email, password: \$password, redirectUrl: "https://alhowaridates.eu.saleor.cloud/account-confirm/"}
  ) {
    user {
      ...userData
    }
  }
}
${Fragments.userNoOrderFields}
''');

  static final isValidToken = gql(r'''
mutation isValidToken($token:String!){
  tokenVerify(token:$token){
    isValid
  }
}
''');
}
