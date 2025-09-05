import 'package:flutter/material.dart';
import '../atoms/weather_icon.dart';
import '../atoms/temperature_text.dart';

class WeatherInfoRow extends StatelessWidget {
  final String weatherIcon;
  final double temperature;

  const WeatherInfoRow({
    Key? key,
    required this.weatherIcon,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeatherIcon(icon: weatherIcon),
        const SizedBox(width: 10),
        TemperatureText(temperature: temperature),
      ],
    );
  }
}