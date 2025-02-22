import 'package:weather_reader/models/forecast_model/forecast_list.dart';

class ForecastModel {
  final String cityName;
  final int timezone;
  final int sunrise;
  final int sunset;
  final List<ForecastList> allForecasts;
  ForecastModel(
      {required this.cityName,
      required this.timezone,
      required this.sunrise,
      required this.sunset,
      required this.allForecasts});
}
