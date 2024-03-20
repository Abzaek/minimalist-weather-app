import 'package:flutter/material.dart';
import 'dart:ui';

class MainWeatherInfoItem extends StatelessWidget {
  final IconData icon;
  final num temprature;
  final String condition;
  const MainWeatherInfoItem({
    super.key,
    required this.temprature,
    required this.condition,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Card(
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    '${(temprature).toStringAsFixed(2)} C',
                    style: const TextStyle(
                      fontFamily: AutofillHints.addressCityAndState,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Icon(icon, size: 70),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    condition,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
