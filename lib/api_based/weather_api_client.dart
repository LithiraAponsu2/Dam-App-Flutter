import 'dart:convert';
import 'package:http/http.dart' as http;

import './weather.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather() async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=7.0606&lon=80.5970&appid=b7177e3afee18daf9ff7d0a70f5bf381");

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
