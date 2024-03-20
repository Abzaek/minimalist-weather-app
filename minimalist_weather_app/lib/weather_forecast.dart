import 'package:flutter/material.dart';

class WeatherInfoItems extends StatelessWidget {
  final String time;
  final String data;
  const WeatherInfoItems({
    super.key,
    required this.time,
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 80,
          child: Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Icon(
                Icons.cloud,
                size: 32,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                data,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
