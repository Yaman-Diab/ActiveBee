import 'dart:convert';

import 'package:http/http.dart' as http;

class ServerManager {
  String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  String apiKey = "e2d2fcd01bd2705c889bfd2de3fc8106";

  Future<String> getCityNameFromCoordinates(double lat, double lon) async {
    final url = Uri.parse(
      '$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&lang=en',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['name'] ?? 'Unknown City';
    } else {
      throw Exception('Connection failed: ${response.statusCode}');
    }
  }
}
