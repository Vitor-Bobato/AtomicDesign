import 'package:flutter/material.dart';

class WeatherDescriptionText extends StatelessWidget {
  final String description;
  final double fontSize;
  final Color color;

  const WeatherDescriptionText({
    Key? key,
    required this.description,
    this.fontSize = 20,
    this.color = Colors.black54,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
      child: Text(
        description,
        textAlign: TextAlign.center,
      ),
    );
  }
}