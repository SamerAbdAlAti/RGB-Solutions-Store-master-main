import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class INetworkInfo implements NetworkInfo {
  final InternetConnectionCheckerPlus connectionChecker;

  INetworkInfo(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
