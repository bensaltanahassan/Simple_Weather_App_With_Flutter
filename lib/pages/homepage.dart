import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Center(
              child: Text(
                'There is no weather data available, please search for a city name to get weather data .',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          : Container(
              color: weatherData!.getColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(flex: 3),
                  Text(
                    'Updated at : ${weatherData!.getTime()}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${weatherData!.date.day}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'images/${weatherData!.weather_state_abbr}.png',
                        width: 100,
                        height: 100,
                      ),
                      Text(
                        '25°',
                        style: TextStyle(fontSize: 40),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '${weatherData!.maxTemperature}°',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '${weatherData!.minTemperature}°',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text('${weatherData!.weatherStateName}',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const Spacer(
                    flex: 6,
                  )
                ],
              ),
            ),
    );
  }
}
