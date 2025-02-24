import 'package:dio/dio.dart';
import 'package:weather_reader/api_key.dart';
import 'package:weather_reader/models/forecast_model/forecast_model.dart';

import 'package:weather_reader/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      sendTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 4)));

  final String api = weatherApiKey;

  Future<WeatherModel> searchByLocationName(String location) async {
    try {
      final response = await dio.get('/weather', queryParameters: {
        'q': location,
        'appid': weatherApiKey,
        'units': 'metric'
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(response.data);
        final result = WeatherModel.fromJson(data);
        // print(result);
        return result;
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<WeatherModel> searchByCoordinates(
      double latitude, double longitude) async {
    try {
      final response = await dio.get('/weather', queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'appid': weatherApiKey,
        'units': 'metric'
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(response.data);
        final result = WeatherModel.fromJson(data);
        // print(result);
        return result;
      } else {
        throw Exception('Failed to fetch Weather data of these coordinates!!');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ForecastModel> getWeatherForecastUsingCoordinates(
      double latitude, double longitude) async {
    print('it is here');
    try {
      print('it tried too!');
      final response = await dio.get('/forecast', queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'appid': weatherApiKey,
        'units': 'metric'
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> forecastData =
            Map<String, dynamic>.from(response.data);

        final resultForecast = ForecastModel.fromJson(forecastData);
        print(resultForecast);
        return resultForecast;
      } else {
        throw Exception('Failet to get weather Forecast!!');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ForecastModel> getWeatherForecastWithName(String location) async {
    try {
      final response = await dio.get('/forecast', queryParameters: {
        'q': location,
        'appid': weatherApiKey,
        'units': 'metric'
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> forecastData =
            Map<String, dynamic>.from(response.data);
        final resultForecast = ForecastModel.fromJson(forecastData);
        return resultForecast;
      } else {
        throw Exception('Failet to get weather Forecast!!');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

void main() async {
  WeatherService service = WeatherService();

  try {
    final forecast =
        await service.getWeatherForecastUsingCoordinates(37.7749, -122.4194);
    print(forecast); // This prints the fetched data
  } catch (e) {
    print('Error: $e'); // This ensures errors don’t crash the script
  }
}
