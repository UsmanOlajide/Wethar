import 'package:flutter/material.dart';

import 'package:wethar/screens/location_screen.dart';
import 'package:wethar/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    locationWeather();
  }

  void locationWeather() async {
    final weather = await WeatherModel().getLocationWeather();

    if (context.mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) {
            return LocationScreen(
              weather,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(
              'FETCHING WEATHER INFO !',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
