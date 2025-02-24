import 'package:meta/meta.dart';

@immutable
class ForecastList {
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final String description;
  final int cloudCoverage;
  final int pressure;
  final String forecastDateTime;

  const ForecastList(
      {required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.humidity,
      required this.windSpeed,
      required this.windDeg,
      required this.description,
      required this.cloudCoverage,
      required this.pressure,
      required this.forecastDateTime});

  factory ForecastList.fromJson(Map<String, dynamic> json) {
    return ForecastList(
        temperature: json['main']['temp'].toDouble() ?? 0,
        minTemperature: json['main']['temp_min'].toDouble() ?? 0,
        maxTemperature: json['main']['temp_max'].toDouble() ?? 0,
        humidity: json['main']['humidity'] ?? 0,
        windSpeed: json['wind']['speed'].toDouble() ?? 0,
        windDeg: json['wind']['deg'] ?? 0,
        description: json['weather'][0]['description'] ?? '',
        cloudCoverage: json['clouds']['all'] ?? 0,
        pressure: json['main']['pressure'] ?? 0,
        forecastDateTime: json['dt_txt'] ?? '');
  }
  Map<String, dynamic> toJson() {
    return {
      'temp': temperature,
      'temp_min': minTemperature,
      'temp_max': maxTemperature,
      'humidity': humidity,
      'speed': windSpeed,
      'deg': windDeg,
      'description': description,
      'clouds': cloudCoverage,
      'pressure': pressure,
      'forecastTime': forecastDateTime
    };
  }

  @override
  String toString() {
    return 'ForecastList(temperature: $temperature, minTemperature: $minTemperature, maxTemperature: $maxTemperature, humidity: $humidity, windSpeed: $windSpeed, windDeg: $windDeg, description: $description, cloudCoverage: $cloudCoverage, pressure: $pressure, forecastDateTime: $forecastDateTime)';
  }
}
