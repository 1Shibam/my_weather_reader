import 'package:flutter/foundation.dart';

@immutable
class WeatherModel {
  final String cityName;
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
      {required this.cityName,
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
        cityName: json['name'],
        latitude: json['coord']['lat'].toDouble(),
        longitude: json['coord']['lon'].toDouble(),
        temperature: json['main']['temp'].toDouble(),
        minTemperature: json['main']['temp_min'].toDouble(),
        maxTemperature: json['main']['temp_max'].toDouble(),
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'].toDouble(),
        windDeg: json['wind']['deg'],
        description: json['weather'][0]['description'],
        cloudCoverage: json['clouds']['all'],
        pressure: json['main']['pressure'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        currentTime: json['dt'],
        timezone: json['timezone']);
  }
  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
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

/* db.execute('''
            CREATE TABLE weatherTable(
            weatherID INTEGER PRIMARY KEY AUTOINCREMENT,
            cityName TEXT NOT NULL,
            REAL lat,
            REAL lon,
            temperature REAL,
            tempMin REAL,
            tempMax REAL,
            humidity INTEGER,
            windSpeed REAL,
            windDeg INTEGER,
            description TEXT,
            cloudCoverage INTEGER,
            pressure INTEGER,
            sunrise INTEGER,
            sunset INTEGER,
            currentTime INTEGER,
            timezone INTEGER
              )
'''); */