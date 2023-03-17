import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InformationFailure extends Failure {
  String message;
  InformationFailure(this.message);
  @override
  List<Object?> get props => [];
}

class StorageNotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}
