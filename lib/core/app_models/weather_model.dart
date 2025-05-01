class WeatherModel {
  String location;


  WeatherModel({
    required this.location,

  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
      location: data['name'],
      
    );
  }
}
