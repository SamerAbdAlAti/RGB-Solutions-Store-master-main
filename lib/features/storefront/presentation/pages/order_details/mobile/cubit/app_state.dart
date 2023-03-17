part of 'app_cubit.dart';

class AppLocationState extends Equatable {
  final double lon;
  final double lat;

  const AppLocationState({
    this.lon = 1,
    this.lat = 1,
  });

  AppLocationState copyWith({
    double? lon,
    double? lat,
  }) {
    return AppLocationState(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  @override
  List<Object> get props => [
        lon,
        lat,
      ];
}
