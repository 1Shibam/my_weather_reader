import 'package:weather_reader/models/weather%20model/weather_data_model.dart';

extension WeatherDataModelExtension on WeatherDataModel {
  Map<String, dynamic> toDatabaseJson() {
    return {
      'cityName': name,
      'lat': coord?.lat,
      'lon': coord?.lon,
      'temperature': main?.temp,
      'tempMin': main?.tempMin,
      'tempMax': main?.tempMax,
      'humidity': main?.humidity,
      'windSpeed': wind?.speed,
      'windDeg': wind?.deg,
      'description': weather?.isNotEmpty == true ? weather![0].description : null,
      'cloudCoverage': clouds?.all,
      'pressure': main?.pressure,
      'sunrise': sys?.sunrise,
      'sunset': sys?.sunset,
      'currentTime': dt,
      'timezone': timezone,
    };
  }
}
