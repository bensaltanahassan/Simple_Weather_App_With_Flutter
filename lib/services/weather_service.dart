import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://www.metaweather.com/';
  Future<int> getCityId(String? city) async {
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$city');
    http.Response response = await http.get(url);
    List<dynamic> data = jsonDecode(response.body);
    int cityId = data[0]['woeid'];
    return cityId;
  }

  Future<WeatherModel> getWeather(String? city) async {
    int cityId = await getCityId(city);
    Uri url = Uri.parse('$baseUrl/api/location/$cityId/');
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    Map<String, dynamic> data = jsonData['consolidated_weather'][0];
    WeatherModel weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }
}
