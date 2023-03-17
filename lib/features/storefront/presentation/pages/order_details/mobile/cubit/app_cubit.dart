import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

part 'app_state.dart';

class AppLocationCubit extends Cubit<AppLocationState> {
  AppLocationCubit() : super(const AppLocationState());

  static AppLocationCubit get(context) => BlocProvider.of(context);

  Future<void> getLocationMethod() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData.longitude);
    print(_locationData.latitude);

    emit(state.copyWith(
      lat: _locationData.longitude,
      lon: _locationData.latitude,
    ));

  }
}
