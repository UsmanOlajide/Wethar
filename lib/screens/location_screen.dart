import 'package:flutter/material.dart';
import 'package:wethar/screens/city_screen.dart';
import 'package:wethar/services/networking.dart';
import 'package:wethar/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherData, {super.key});

  final Map<String, dynamic> weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  late String cityName;
  late String weatherIcon;
  late String weatherMessage;
  final weather = WeatherModel();
  // String userInput = 'A';

  @override
  void initState() {
    super.initState();
    // print(widget.weatherData);
    updateUIWithWeatherData(widget.weatherData);
  }

  void updateUIWithWeatherData(Map<String, dynamic> weatherData) {
    setState(() {
      double temperature = weatherData['main']['temp'];
      temp = temperature.toInt();
      cityName = weatherData['name'];
      final condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getWeatherMessage(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () async {
                    final currentWeatherData =
                        await WeatherModel().getLocationWeather();
                    updateUIWithWeatherData(currentWeatherData);
                  },
                  icon: const Icon(Icons.near_me),
                  iconSize: 40,
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () async {
                    final typedInput = await Navigator.of(context).push<String>(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return CityScreen();
                        },
                      ),
                    );
                    if (typedInput == null) return;
                    print(typedInput);
                    // if (context.mounted) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text('Enter a city name'),
                    //     ),
                    //   );
                    // }

                    final userWeatherData =
                        await WeatherModel().getACityWeather(typedInput);

                    updateUIWithWeatherData(userWeatherData);
                  },
                  icon: const Icon(Icons.location_city),
                  iconSize: 40,
                  color: Colors.white,
                ),
              ],
            ),
            Center(
              child: Text(
                '$temp°c $weatherIcon',
                style: const TextStyle(
                    backgroundColor: Colors.black38,
                    fontSize: 110,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '$weatherMessage in $cityName',
              style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

//* Logic of networking and getLocationWeather combo
  // Future<Map<String, dynamic>> getLocationWeather() async {
  //   //  url from openWeather API https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

  //   final currentLocation = CurrentLocation();
  //   await currentLocation.getCurrentLocation();

  //   // print(currentLocation.latitude);
  //   final queryParameters = {
  //     'lat': currentLocation.latitude,
  //     'lon': currentLocation.longitude,
  //     'appid': 'b2c13ca41356527581cd6cb5011696ee',
  //     'units': 'metric',
  //   };

  //   final url = Uri.https(
  //       'api.openweathermap.org', '/data/2.5/weather', queryParameters);
  //   //-------------NETWORK HELPER
  //   final response = await http.get(url);

  //   if (response.statusCode >= 400) {
  //     print(response.statusCode);
  //   }

  //   final data = response.body;

  //   final Map<String, dynamic> weatherData = jsonDecode(data);
  //   return weatherData;
  //   // ----------------
  // }


          // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/nature.jpeg'),
        //     colorFilter: ColorFilter.mode(
        //       Color(0xFF3D3D3D),
        //       BlendMode.dstATop,
        //     ),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // constraints: const BoxConstraints.expand(),