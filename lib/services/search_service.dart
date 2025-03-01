import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_reader/models/search%20suggestion%20model/search_suggestions.dart';

class SearchService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: dotenv.env['SUGGESTIONS_BASE_URL']!,
    // baseUrl: 'https://api.locationiq.com/v1',
    receiveTimeout: const Duration(seconds: 4),
    sendTimeout: const Duration(seconds: 7),
  ));

  final String apiKey =
      dotenv.env['SUGGESTIONS_API_KEY']!; // Replace with your actual API key

  Future<List<SearchSuggestions>> placeSuggestion(String input) async {
    try {
      final response = await dio.get('/autocomplete.php', queryParameters: {
        'key': apiKey,
        'q': input,
        'format': 'json',
      });

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(response.data);
        final result =
            data.map((json) => SearchSuggestions.fromJson(json)).toList();

        return result;
      } else {
        return [];
      }
    } catch (e) {
      
      return [];
      
    }
  }
}
