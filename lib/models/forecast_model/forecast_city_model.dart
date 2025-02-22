class ForecastModel {
  final String cityName;
  final int timezone;
  final int sunrise;
  final int sunset;
  ForecastModel(
      {required this.cityName,
      required this.timezone,
      required this.sunrise,
      required this.sunset});
}
