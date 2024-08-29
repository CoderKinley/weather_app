import 'package:flutter/material.dart';
import 'package:tut_app/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}

// Weather API Key
// e54148e4d80dfe32a29103decfae2456
// penjorkinley313@gmail.com
// Kuenlay@hacker12