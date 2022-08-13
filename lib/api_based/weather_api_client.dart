import 'dart:convert';
import 'package:http/http.dart' as http;

import './weather.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather() async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat={your_lat}&lon={your_long}&appid={your_app_id}");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
