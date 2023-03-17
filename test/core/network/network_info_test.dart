import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saleor_app_flutter/core/network/network_info.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionCheckerPlus])
void main() {
  late INetworkInfo networkInfo;
  late MockInternetConnectionCheckerPlus mockInternetConnectionChecker;
  setUp(
    () {
      mockInternetConnectionChecker = MockInternetConnectionCheckerPlus();
      networkInfo = INetworkInfo(mockInternetConnectionChecker);
    },
  );

  group("isConnected", () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      //arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockInternetConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);
      //act
      final result = networkInfo.isConnected;
      //assert
      verify(mockInternetConnectionChecker.hasConnection);
      expect(await result, await tHasConnectionFuture);
    });
  });
}
