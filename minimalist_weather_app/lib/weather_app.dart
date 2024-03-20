import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:minimalist_weather_app/weather_forecast.dart';

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    int result = 300;
    String data = 'Rain';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                print('refreshed');
              },
              icon: const Icon(Icons.refresh)),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '$result F',
                            style: const TextStyle(
                              fontFamily: AutofillHints.addressCityAndState,
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Icon(Icons.cloud, size: 70),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            data,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WeatherInfoItems(time: '02:00', data: '27 C'),
                  WeatherInfoItems(time: '05:00', data: '38 C'),
                  WeatherInfoItems(time: '08:00', data: '21 c'),
                  WeatherInfoItems(time: '05:00', data: '38 C'),
                  WeatherInfoItems(time: '08:00', data: '21 c'),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: 32,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Humidity',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '90',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 64,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.water_outlined,
                      size: 32,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Wind Speed',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '190',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 64,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.cloud_circle,
                      size: 32,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Pressure',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '1090',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
