import 'package:wethar/services/networking.dart';
import 'package:wethar/services/current_location.dart';

const openWeatherUrl = 'api.openweathermap.org';
const urlPath = '/data/2.5/weather';
const appid = 'b2c13ca41356527581cd6cb5011696ee';

//* HANDLES two methods weatherIcon & weatherMessage
class WeatherModel {
  Future<Map<String, dynamic>> getACityWeather(String cityName) async {
    final queryParameters = {
      'q': cityName,
      'appid': 'b2c13ca41356527581cd6cb5011696ee',
      'units': 'metric',
    };
    final url = Uri.https(openWeatherUrl, urlPath, queryParameters);
    final networking = Networking(url);
    final cityWeatherData = await networking.fetchWeatherData();
    return cityWeatherData;
  }

  Future<Map<String, dynamic>> getLocationWeather() async {
    final currentLocation = CurrentLocation();
    await currentLocation.getCurrentLocation();

    final queryParameters = {
      'lat': '${currentLocation.latitude}',
      'lon': '${currentLocation.longitude}',
      'appid': 'b2c13ca41356527581cd6cb5011696ee',
      'units': 'metric',
    };

    final url = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    //-------------NETWORK HELPER
    final networking = Networking(url);
    final weatherData = networking.fetchWeatherData();
    return weatherData;
    // ----------------
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
