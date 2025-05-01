// // lib/managers/location_manager.dart

// import 'package:geolocator/geolocator.dart';

// class LocationManager {
//   Future<Position> getCurrentPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       throw Exception('خدمة الموقع غير مفعلة');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         throw Exception('تم رفض إذن الموقع');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       throw Exception('رفض دائم لإذن الموقع');
//     }

//     // استخدام LocationSettings الجديد
//     LocationSettings locationSettings = const LocationSettings(
//       accuracy: LocationAccuracy.high,
//     );

//     return await Geolocator.getCurrentPosition(
//       locationSettings: locationSettings,
//     );
//   }
// }
