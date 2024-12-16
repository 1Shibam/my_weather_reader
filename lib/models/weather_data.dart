class WeatherData {
  final String cityName;
  final double temperature;
  final double tempMin;
  final double tempMax;
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

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.description,
    required this.cloudCoverage,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
    required this.currentTime,
    required this.timezone,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final temp = json['main']['temp'].toDouble();
    final tempMin = json['main']['temp_min'].toDouble();
    final tempMax = json['main']['temp_max'].toDouble();
    final humidity = json['main']['humidity'];
    final windSpeed = json['wind']['speed'].toDouble();
    final windDeg = json['wind']['deg'];
    final description = json['weather'][0]['description'];
    final cloudCoverage = json['clouds']['all'];
    final pressure = json['main']['pressure'];

    final sunrise = json['sys']['sunrise'];
    final sunset = json['sys']['sunset'];
    final currentTime = json['dt']; 

    return WeatherData(
      cityName: json['name'],
      temperature: temp,
      tempMin: tempMin,
      tempMax: tempMax,
      humidity: humidity,
      windSpeed: windSpeed,
      windDeg: windDeg,
      description: description,
      cloudCoverage: cloudCoverage,
      pressure: pressure,
      sunrise: sunrise,
      sunset: sunset,
      currentTime: currentTime,
      timezone: json['timezone'],
    );
  }
}
