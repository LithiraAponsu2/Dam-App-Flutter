import 'package:dam_app/widgets/weather_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import 'package:dam_app/api_based/weather.dart';
import 'package:dam_app/api_based/weather_api_client.dart';

class WeatherDataScreen extends StatefulWidget {
  const WeatherDataScreen({Key? key}) : super(key: key);

  @override
  State<WeatherDataScreen> createState() => _WeatherDataScreenState();
}

class _WeatherDataScreenState extends State<WeatherDataScreen> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(25),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2.4 / 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 50,
            ),
            children: [
              WeatherItem(
                id: '1',
                title: 'Main',
                value: toBeginningOfSentenceCase(data!.mainWeather),
              ),
              WeatherItem(
                id: '2',
                title: 'Pressure',
                value: '${data!.pressure} hPa',
              ),
              WeatherItem(
                id: '3',
                title: 'Temperature',
                value:
                    '${((data!.temperature)! - 273.15).toStringAsFixed(2)} \u00B0C',
              ),
              WeatherItem(
                id: '4',
                title: 'Humidity',
                value: '${data!.humidity} %',
              ),
              WeatherItem(
                id: '5',
                title: 'Wind Speed',
                value: '${data!.windSpeed} m/s',
              ),
              WeatherItem(
                id: '6',
                title: 'Wind Direction',
                value: '${data!.windDirection} \u00B0',
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
