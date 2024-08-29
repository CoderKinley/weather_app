import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tut_app/models/weather_models.dart';
import 'package:tut_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //  api key
  final _weatherService = WeatherService("6f3dd3c71c57ff183b3dccfa6b005829");
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get the current city
    String cityName = await _weatherService.getCurrentCity();
    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animation
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'lib/assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
        return "lib/assets/weather3.json";
      case 'haze':
      case 'dust':
        return "lib/assets/weather1.json";
      case 'fog':
        return "lib/assets/weather2.json";
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return "lib/assets/weather4.json";
      case 'thunderstorm':
        return "lib/assets/weather4.json";
      case 'clear':
        return "lib/assets/weather2.json";
      default:
        return "lib/assets/weather2.json";
    }
  }

  // weather animation
  // init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch the weather
    _fetchWeather();
  }

  /*
  weather 1 = cloudy
  weather 2 = sunny
  weather 3 = partial cloud
  weather 4 = lightnign
  weather 5 = sun plus rain
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? "loading city..."),
            // animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            // temp
            Text('${_weather?.temperature.round()}°C'),

            // weather condition
          ],
        ),
      ),
    );
  }
}
