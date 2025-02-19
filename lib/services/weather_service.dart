import 'package:dio/dio.dart';
import 'package:my_weather_reader/api_key.dart';
import 'package:my_weather_reader/models/forecast_model/forecast_data_model.dart';
import 'package:my_weather_reader/models/weather_data.dart';

class WeatherService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      sendTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 4)));

  final String api = weatherApiKey;

  Future<WeatherDataModel> searchByLocationName(String location) async {
    try {
      final response = await dio.get('/weather', queryParameters: {
        'q': location,
        'appid': weatherApiKey,
        'units': 'metric'
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(response.data);
        final result = WeatherDataModel.fromJson(data);
        // print(result);
        return result;
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<WeatherDataModel> searchByCoordinates(
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
        final result = WeatherDataModel.fromJson(data);
        // print(result);
        return result;
      } else {
        throw Exception('Failed to fetch Weather data of these coordinates!!');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ForecastDataModel> getWeatherForecast(
      double latitude, double longitude) async {
    try {
      final response = await dio.get('/forecast', queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'appid': weatherApiKey,
        'units': 'metric'
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> forecastData =
            Map<String, dynamic>.from(response.data);
        final resultForecast = ForecastDataModel.fromJson(forecastData);
        return resultForecast;
      } else {
        throw Exception('Failet to get weather Forecast!!');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

void main() {
  WeatherService service = WeatherService();
  service.getWeatherForecast(37.7749, -122.4194);
}
