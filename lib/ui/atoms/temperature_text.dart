import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  final double temperature;
  final double fontSize;
  final Color color;

  const TemperatureText({
    Key? key,
    required this.temperature,
    this.fontSize = 60,
    this.color = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w200,
        color: color,
      ),
      child: Text('${temperature}°C'),
    );
  }
}