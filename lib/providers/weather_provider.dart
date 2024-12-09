// ignore_for_file: prefer_const_declarations

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'dart:convert';
import '../models/weather_data.dart';

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
      final apiKey =
          'd883d55ce60637ed5b3e1758432f864e'; // Replace with your API key
      final url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
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

  Future<void> fetchWeatherByCity(String city) async {
    state = WeatherState(isLoading: true);
    try {
      final apiKey =
          'd883d55ce60637ed5b3e1758432f864e'; // Replace with your API key
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
