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
      print(response.statusCode);

      if (response.statusCode == 200) {
        print('i am inside the if block');
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(response.data);
        print(data);
        final result =
            data.map((json) => SearchSuggestions.fromJson(json)).toList();
        print(result.length);
        print(result.isEmpty);

        return result;
      } else {
        return [];
      }
    } catch (e) {
      print('emtpy ass nigga');
      return [];
    }
  }
}

void main() async {
  SearchService searchService = SearchService();
  await searchService.placeSuggestion('nigeria');
}
