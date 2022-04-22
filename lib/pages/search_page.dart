import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  WeatherService weatherService = WeatherService();
  String? cityName;
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              suffixIcon: IconButton(
                  onPressed: () async {
                    cityName = _controller.text;
                    WeatherModel weatherModel =
                        await weatherService.getWeather(cityName);

                    Provider.of<WeatherProvider>(context,
                            listen:
                                false) // listen: false is used to avoid rebuild
                        .weatherData = weatherModel;

                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.search)),
              hintText: 'Enter a city name',
              border: OutlineInputBorder(),
              label: Text('City Name'),
            ),
          ),
        ),
      ),
    );
  }
}
