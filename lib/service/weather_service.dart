import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:tut_app/models/weather_models.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  static const NOMINATIM_URL = "https://nominatim.openstreetmap.org/reverse";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> getWeather(String countryName) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$countryName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather data");
    }
  }

  Future<String> getCurrentCity() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check for location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition();

    // Use Nominatim API for reverse geocoding
    try {
      final response = await http.get(Uri.parse(
          '$NOMINATIM_URL?format=json&lat=${position.latitude}&lon=${position.longitude}&zoom=3'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final country = data['address']['country'];
        return country ?? "Unknown";
      } else {
        throw Exception('Failed to get country name');
      }
    } catch (e) {
      print("Error during reverse geocoding: $e");
      return "Unknown";
    }
  }
}
