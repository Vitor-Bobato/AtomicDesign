class WeatherModel {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final String weatherIcon;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.weatherIcon,
  });

  WeatherModel copyWith({
    String? cityName,
    double? temperature,
    String? weatherDescription,
    String? weatherIcon,
  }) {
    return WeatherModel(
      cityName: cityName ?? this.cityName,
      temperature: temperature ?? this.temperature,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      weatherIcon: weatherIcon ?? this.weatherIcon,
    );
  }
}