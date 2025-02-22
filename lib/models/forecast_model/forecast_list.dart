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
  final String forecastTime;

  ForecastList(
      {required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.humidity,
      required this.windSpeed,
      required this.windDeg,
      required this.description,
      required this.cloudCoverage,
      required this.pressure,
      required this.forecastTime});

  factory ForecastList.fromJson(Map<String, dynamic> json) {
    return ForecastList(
        temperature: json['main']['temp'].toDouble(),
        minTemperature: json['main']['temp_min'].toDouble(),
        maxTemperature: json['main']['temp_max'].toDouble(),
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed'].toDouble(),
        windDeg: json['wind']['deg'],
        description: json['weather'][0]['description'],
        cloudCoverage: json['clouds']['all'],
        pressure: json['main']['pressure'],
        forecastTime: json['dt_txt']);
  }
}
