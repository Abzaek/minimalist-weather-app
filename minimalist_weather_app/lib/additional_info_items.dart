import 'package:flutter/material.dart';

class AdditionalInfoItems extends StatelessWidget {
  final String label;
  final num value;
  final IconData icon;
  const AdditionalInfoItems({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '$value',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
