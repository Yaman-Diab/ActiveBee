// // import 'package:active_bee/core/app_models/weather_model.dart';
// // import 'package:active_bee/features/main_screen/screen/home/cubit/city_name_state.dart';
// // import 'package:active_bee/features/main_screen/screen/home/service/location_maneger.dart';
// // import 'package:active_bee/features/main_screen/screen/home/service/location_service.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class CityNameCubit extends Cubit<CityNameState> {
// //   CityNameCubit() : super(CityNameInitial());

// //   LocationManeger locationManeger = LocationManeger();
// //   LocationService locationService = LocationService();

// //   Future getWeatherData() async {
// //     emit(CityNameLoading());
// //     try {
// //       await locationManeger.getMyLocation();
// //       WeatherModel x = await locationService.getTemperature(
// //         locationManeger.latitude!,
// //         locationManeger.longitude!,
// //       );
// //       emit(CityNameSuccess(x));
// //     } catch (e) {
// //       emit(CityNameError(e.toString()));
// //     }
// //   }
// // }


// // lib/cubit/location_cubit.dart

// import 'package:active_bee/features/main_screen/screen/home/cubit/location_state.dart';
// import 'package:active_bee/features/main_screen/screen/home/manager/location_maneger.dart';
// import 'package:active_bee/features/main_screen/screen/home/manager/server_manager.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class LocationCubit extends Cubit<LocationState> {
//   final LocationManager locationManager;
//   final ServerManager serverManager;

//   LocationCubit({
//     required this.locationManager,
//     required this.serverManager,
//   }) : super(LocationInitial());

//   Future<void> fetchCityName() async {
//     emit(LocationLoading());

//     try {
//       final position = await locationManager.getCurrentPosition();
//       final cityName = await serverManager.getCityNameFromCoordinates(
//         position.latitude,
//         position.longitude,
//       );
//       emit(LocationSuccess(cityName));
//     } catch (e) {
//       emit(LocationError('حدث خطأ: ${e.toString()}'));
//     }
//   }
// }
