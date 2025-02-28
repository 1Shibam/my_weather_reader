import 'package:meta/meta.dart';

@immutable
class WeatherModel {
  final int? weatherId;
  final String cityName;
  final String country;
  final double latitude;
  final double longitude;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final String description;
  final int cloudCoverage;
  final int pressure;
  final int sunrise;
  final int sunset;
  final int currentTime;
  final int timezone;

  const WeatherModel(
      {this.weatherId,
      required this.cityName,
      required this.country,
      required this.latitude,
      required this.longitude,
      required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.humidity,
      required this.windSpeed,
      required this.windDeg,
      required this.description,
      required this.cloudCoverage,
      required this.pressure,
      required this.sunrise,
      required this.sunset,
      required this.currentTime,
      required this.timezone});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    
    return WeatherModel(
        weatherId: json['weatherID'] as int? ?? 0,
        cityName: json['name'] ?? 'unkown city',
        country: json['sys']['country'] ?? 'unknown country',
        latitude: json['coord']['lat'].toDouble() ?? 0,
        longitude: json['coord']['lon'].toDouble() ?? 0,
        temperature: json['main']['temp'].toDouble() ?? 0,
        minTemperature: json['main']['temp_min'].toDouble() ?? 0,
        maxTemperature: json['main']['temp_max'].toDouble() ?? 0,
        humidity: json['main']['humidity'] ?? 0,
        windSpeed: json['wind']['speed'].toDouble() ?? 0,
        windDeg: json['wind']['deg'] ?? 0,
        description: json['weather'][0]['description'] ?? 'unknown',
        cloudCoverage: json['clouds']['all'] ?? 0,
        pressure: json['main']['pressure'] ?? 0,
        sunrise: json['sys']['sunrise'] ?? 0,
        sunset: json['sys']['sunset'] ?? 0,
        currentTime: json['dt'] ?? 0,
        timezone: json['timezone'] ?? 0);
  }
  factory WeatherModel.fromDBMap(Map<String, dynamic> map) {
  return WeatherModel(
    weatherId: map['weatherID'] as int?,
    cityName: map['cityName'] as String,
    country: map['country'] as String,
    latitude: (map['lat'] as num).toDouble(),
    longitude: (map['lon'] as num).toDouble(),
    temperature: (map['temperature'] as num).toDouble(),
    minTemperature: (map['tempMin'] as num).toDouble(),
    maxTemperature: (map['tempMax'] as num).toDouble(),
    humidity: map['humidity'] as int,
    windSpeed: (map['windSpeed'] as num).toDouble(),
    windDeg: map['windDeg'] as int,
    description: map['description'] as String,
    cloudCoverage: map['cloudCoverage'] as int,
    pressure: map['pressure'] as int,
    sunrise: map['sunrise'] as int,
    sunset: map['sunset'] as int,
    currentTime: map['currentTime'] as int,
    timezone: map['timezone'] as int,
  );
}
  Map<String, dynamic> toJson() {
    return {
      'weatherID': weatherId,
      'cityName': cityName,
      'country': country,
      'lat': latitude,
      'lon': longitude,
      'temperature': temperature,
      'tempMin': minTemperature,
      'tempMax': maxTemperature,
      'humidity': humidity,
      'windSpeed': windSpeed,
      'windDeg': windDeg,
      'description': description,
      'cloudCoverage': cloudCoverage,
      'pressure': pressure,
      'sunrise': sunrise,
      'sunset': sunset,
      'currentTime': currentTime,
      'timezone': timezone
    };
  }
}
