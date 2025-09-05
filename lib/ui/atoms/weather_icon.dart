import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String icon;
  final double size;

  const WeatherIcon({
    Key? key,
    required this.icon,
    this.size = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Text(
        icon,
        style: TextStyle(fontSize: size),
      ),
    );
  }
}