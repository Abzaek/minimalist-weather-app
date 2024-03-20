import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minimalist_weather_app/additional_info_items.dart';
import 'package:minimalist_weather_app/main_weather_info.dart';
import 'package:minimalist_weather_app/weather_forecast.dart';
import 'package:http/http.dart' as http;
import 'secret_code.dart';
import 'datas.dart';
import 'package:minimalist_weather_app/looding.dart';

class MyWeatherApp extends StatefulWidget {
  const MyWeatherApp({super.key});

  @override
  State<MyWeatherApp> createState() => _MyWeatherAppState();
}

class _MyWeatherAppState extends State<MyWeatherApp> {
  bool isLooding = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  void getInfo() async {
    setState(() {
      isLooding = true;
    });
    try {
      final res = await http.get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$apiKey'));
      final weather = jsonDecode(res.body);
      if (weather['cod'] != '200') {
        throw 'Unable to retrieve data';
      } else {
        setState(() {
          final lst = weather['list'];

          for (int i = 0; i < 6; i++) {
            String current = lst[i]['dt_txt'];
            temp[i] = lst[i]['main']['temp'] - 273.15;
            time[i] = current.substring(current.length - 9, current.length - 3);
          }
          cond = weather['list'][0]['weather'][0]['main'];
          humidity = lst[0]['main']['humidity'];
          windSpeed = lst[0]['wind']['speed'];
          pressure = lst[0]['main']['pressure'];
          isLooding = false;
        });
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLooding) {
      return const Looding();
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(onPressed: getInfo, icon: const Icon(Icons.refresh)),
          ],
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainWeatherInfoItem(
                  temprature: temp[0], condition: cond, icon: Icons.cloud),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    WeatherInfoItems(
                      time: time[1],
                      data: '${(temp[1]).toStringAsFixed(2)} C',
                    ),
                    WeatherInfoItems(
                      time: time[2],
                      data: '${(temp[2]).toStringAsFixed(2)} C',
                    ),
                    WeatherInfoItems(
                      time: time[3],
                      data: '${(temp[3]).toStringAsFixed(2)} C',
                    ),
                    WeatherInfoItems(
                      time: time[4],
                      data: '${(temp[4]).toStringAsFixed(2)} C',
                    ),
                    WeatherInfoItems(
                      time: time[5],
                      data: '${(temp[5]).toStringAsFixed(2)} C',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AdditionalInfoItems(
                      label: 'Humidity',
                      value: humidity,
                      icon: Icons.water_drop),
                  const SizedBox(
                    width: 64,
                  ),
                  AdditionalInfoItems(
                      label: 'Wind Speed', value: windSpeed, icon: Icons.air),
                  const SizedBox(
                    width: 64,
                  ),
                  AdditionalInfoItems(
                      label: 'Pressure',
                      value: pressure,
                      icon: Icons.beach_access),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
