import 'package:flutter/material.dart';

class CityNameText extends StatelessWidget {
  final String cityName;
  final double fontSize;
  final Color color;

  const CityNameText({
    Key? key,
    required this.cityName,
    this.fontSize = 30,
    this.color = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 300),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      child: Text(
        cityName,
        textAlign: TextAlign.center,
      ),
    );
  }
}