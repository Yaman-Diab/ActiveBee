// import 'dart:convert';
// import 'package:http/http.dart' as http;



// class ServerManager {

//   String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
//   String apiKey = "e2d2fcd01bd2705c889bfd2de3fc8106";

//   Future<String> getCityNameFromCoordinates(double lat, double lon) async {
//     final url = Uri.parse(
//       'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&lang=ar',
//     );

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['name'] ?? 'مدينة غير معروفة';
//     } else {
//       throw Exception('فشل الاتصال: ${response.statusCode}');
//     }
//   }
// }

