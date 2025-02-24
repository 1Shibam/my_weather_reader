import 'package:meta/meta.dart';
import 'package:weather_reader/models/forecast_model/forecast_list.dart';

@immutable
class ForecastModel {
  final String cityName;
  final String country;
  final int timezone;
  final int sunrise;
  final int sunset;
  final List<ForecastList> allForecasts;
  const ForecastModel(
      {required this.cityName,
      required this.country,
      required this.timezone,
      required this.sunrise,
      required this.sunset,
      required this.allForecasts});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
        cityName: json['city']['name'] ?? '',
        country: json['city']['country'] ?? '',
        timezone: json['city']['timezone'] ?? 0,
        sunrise: json['city']['sunrise'] ?? 0,
        sunset: json['city']['sunset'] ?? 0,
        allForecasts: (json['list'] as List).map((json) {
          return ForecastList.fromJson(json);
        }).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'country': country,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
      'list': allForecasts.map((data) => data.toJson()).toList()
    };
  }

  @override
  String toString() {
    return 'ForecastModel(cityName: $cityName, country: $country, timezone: $timezone, sunrise: $sunrise, sunset: $sunset, allForecasts: $allForecasts)';
  }
}
