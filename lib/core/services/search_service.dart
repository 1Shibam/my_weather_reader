// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:my_weather_reader/api_key.dart';

class SearchService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.locationiq.com/v1',
    receiveTimeout: const Duration(seconds: 4),
    sendTimeout: const Duration(seconds: 7),
  ));

  final String apiKey = mapsApiKey; // Replace with your actual API key

  Future<void> placeSuggestion(String input) async {
    try {
      final response = await dio.get('/autocomplete.php', queryParameters: {
        'key': apiKey,
        'q': input,
        'format': 'json',
      });

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;

        if (data.isNotEmpty) {
          print('Place Suggestions:');
          for (var place in data) {
            print('- ${place['display_name']}');
          }
        } else {
          print('No suggestions found.');
        }
      } else {
        print('Failed to fetch data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}