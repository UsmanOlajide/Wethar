import 'dart:convert';
import 'package:http/http.dart' as http;

//* this class is to fetch weather info from api, just a get request
class Networking {
  Networking(this.url);

  final Uri url;

  Future<Map<String, dynamic>> fetchWeatherData() async {
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      print(response.statusCode);
    }

    final data = response.body;

    final Map<String, dynamic> weatherData = jsonDecode(data);
    return weatherData;
  }
}
