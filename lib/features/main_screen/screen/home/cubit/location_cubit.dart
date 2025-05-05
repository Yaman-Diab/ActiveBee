import 'package:active_bee/features/main_screen/screen/home/cubit/location_state.dart';
import 'package:active_bee/features/main_screen/screen/home/manager/location_maneger.dart';
import 'package:active_bee/features/main_screen/screen/home/manager/server_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationManager locationManager;
  final ServerManager serverManager;

  LocationCubit({
    required this.locationManager,
    required this.serverManager,
  }) : super(LocationInitial());

  Future<void> fetchCityName() async {
    emit(LocationLoading());

    try {
      final position = await locationManager.getCurrentPosition();
      final cityName = await serverManager.getCityNameFromCoordinates(
        position.latitude,
        position.longitude,
      );
      emit(LocationSuccess(cityName));
    } catch (e) {
      emit(LocationError('حدث خطأ: ${e.toString()}'));
    }
  }
}
