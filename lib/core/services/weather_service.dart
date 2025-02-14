import 'package:dio/dio.dart';
import 'package:my_weather_reader/api_key.dart';
import 'package:my_weather_reader/models/weather_data.dart';

class WeatherService {
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      sendTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 4)));

  final String api = weatherApiKey;

//   Future<WeatherData> searchByLocationName(String location) async {
//     try {
//       final response = await dio.get('/weather', queryParameters: {
//         'lat' :
//       });
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
}

/*
class WeatherState {
  final WeatherData? weather;
  final bool isLoading;
  final String error;

  WeatherState({
    this.weather,
    this.isLoading = false,
    this.error = '',
  });
}

class WeatherNotifier extends StateNotifier<WeatherState> {
  WeatherNotifier() : super(WeatherState(isLoading: true));

  Future<void> fetchWeatherByCoordinates(double lat, double lon) async {
    state = WeatherState(isLoading: true);
    try {
      final apiKey = weatherApiKey;
      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final _weather = WeatherData.fromJson(json.decode(response.body));
        state = WeatherState(weather: _weather, isLoading: false);
      } else {
        state = WeatherState(
            error: 'Failed to load weather data', isLoading: false);
      }
    } catch (e) {
      state = WeatherState(error: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchWeatherByCity(String city) async {
    state = WeatherState(isLoading: true);
    try {
      final apiKey = weatherApiKey;
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final weather = WeatherData.fromJson(json.decode(response.body));
        state = WeatherState(weather: weather, isLoading: false);
      } else {
        state = WeatherState(
            error: 'Failed to load weather data', isLoading: false);
      }
    } catch (e) {
      state = WeatherState(error: e.toString(), isLoading: false);
    }
  }
}

final weatherProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  return WeatherNotifier();
});
*/
