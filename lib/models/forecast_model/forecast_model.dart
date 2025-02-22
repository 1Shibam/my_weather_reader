import 'package:flutter/material.dart';
import 'package:weather_reader/models/forecast_model/forecast_list.dart';

@immutable
class ForecastModel {
  final String cityName;
  final int timezone;
  final int sunrise;
  final int sunset;
  final List<ForecastList> allForecasts;
  const ForecastModel(
      {required this.cityName,
      required this.timezone,
      required this.sunrise,
      required this.sunset,
      required this.allForecasts});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        cityName: json['city']['name'],
        timezone: json['timezone'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        allForecasts: (json['list'] as List).map((json) {
          return ForecastList.fromJson(json);
        }).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
      'list': allForecasts.map((data) => data.toJson()).toList()
    };
  }
}
