import 'package:flutter/material.dart';
import '../atoms/city_name_text.dart';
import '../atoms/weather_description_text.dart';
import '../molecules/weather_info_row.dart';

class WeatherCard extends StatefulWidget {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final String weatherIcon;

  const WeatherCard({
    Key? key,
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _colorAnimation = ColorTween(
      begin: Colors.white.withOpacity(0.8),
      end: Colors.white,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: _colorAnimation.value,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CityNameText(cityName: widget.cityName),
                const SizedBox(height: 10),
                WeatherInfoRow(
                  weatherIcon: widget.weatherIcon,
                  temperature: widget.temperature,
                ),
                const SizedBox(height: 10),
                WeatherDescriptionText(description: widget.weatherDescription),
              ],
            ),
          );
        },
      ),
    );
  }
}