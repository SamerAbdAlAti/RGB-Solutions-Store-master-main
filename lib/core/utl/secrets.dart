import 'package:graphql_flutter/graphql_flutter.dart';

class Constants {
  static Link apiLink =
      HttpLink("https://alhowaridates.eu.saleor.cloud/graphql/");
  static Link authLink = AuthLink(
          getToken: () {
            return 'Bearer mw9OTdf7YoynlOq8vtq7VnM5HEoIkW';
          },
          headerKey: 'authorization')
      .concat(apiLink);
  static Link userAuthLink(String token) {
    return AuthLink(getToken: () async => 'Bearer $token').concat(apiLink);
  }
}
