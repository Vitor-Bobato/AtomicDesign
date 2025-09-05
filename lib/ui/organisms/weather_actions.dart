import 'package:flutter/material.dart';
import '../molecules/button_section.dart';

class WeatherActions extends StatefulWidget {
  final VoidCallback onUpdateWeather;
  final VoidCallback onSearchCity;

  const WeatherActions({
    Key? key,
    required this.onUpdateWeather,
    required this.onSearchCity,
  }) : super(key: key);

  @override
  _WeatherActionsState createState() => _WeatherActionsState();
}

class _WeatherActionsState extends State<WeatherActions>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Delay para iniciar a animação após o card aparecer
    Future.delayed(const Duration(milliseconds: 400), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: ButtonSection(
          onUpdateWeather: widget.onUpdateWeather,
          onSearchCity: widget.onSearchCity,
        ),
      ),
    );
  }
}