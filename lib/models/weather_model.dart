import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  String weather_state_abbr;
  DateTime date;
  double temperature;
  double minTemperature;
  double maxTemperature;

  WeatherModel(
      {required this.weatherStateName,
      required this.weather_state_abbr,
      required this.date,
      required this.temperature,
      required this.minTemperature,
      required this.maxTemperature});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      weatherStateName: json['weather_state_name'],
      date: DateTime.parse(json['created']),
      temperature: json['the_temp'],
      minTemperature: json['min_temp'],
      maxTemperature: json['max_temp'],
      weather_state_abbr: json['weather_state_abbr'],
    );
  }

  MaterialColor getColor() {
    switch (weatherStateName) {
      case 'Clear':
        return Colors.blue;
      case 'Light Clouds':
        return Colors.blue;
      case 'Heavy Cloud':
        return Colors.blueGrey;
      case 'Showers':
        return Colors.blueGrey;
      case 'Light Rain	':
        return Colors.grey;
      case 'Heavy Rain':
        return Colors.grey;
      case 'Thunderstorm':
        return Colors.grey;
      case 'Hail':
        return Colors.grey;
      case 'Sleet':
        return Colors.grey;
      case 'Snow':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  String getTime() {
    return '${date.hour.toString()}:${date.minute.toString()}:${date.second.toString()}';
  }
}
