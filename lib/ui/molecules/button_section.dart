import 'package:flutter/material.dart';
import '../atoms/custom_button.dart';

class ButtonSection extends StatelessWidget {
  final VoidCallback onUpdateWeather;
  final VoidCallback onSearchCity;

  const ButtonSection({
    Key? key,
    required this.onUpdateWeather,
    required this.onSearchCity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Atualizar Clima',
          onPressed: onUpdateWeather,
        ),
        const SizedBox(height: 10),
        CustomButton(
          text: 'Buscar Nova Cidade',
          onPressed: onSearchCity,
          outlined: true,
        ),
      ],
    );
  }
}