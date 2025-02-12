import 'package:dio/dio.dart';
import 'package:my_weather_reader/api_key.dart';
import 'package:my_weather_reader/models/search_suggestions.dart';

class SearchService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.locationiq.com/v1',
    receiveTimeout: const Duration(seconds: 4),
    sendTimeout: const Duration(seconds: 7),
  ));

  final String apiKey = mapsApiKey; // Replace with your actual API key

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

void main() async {
  SearchService searchService = SearchService();
  await searchService.placeSuggestion('nigeria');
}
