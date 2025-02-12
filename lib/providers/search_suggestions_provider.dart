import 'package:my_weather_reader/core/services/search_service.dart';
import 'package:my_weather_reader/models/search_suggestions.dart';
import 'package:riverpod/riverpod.dart';


final searchServiceProvider = Provider<SearchService>((ref) => SearchService());

final searchSuggestionsProvider =
    StateNotifierProvider<SearchSuggestionNotifier, List<SearchSuggestions>>(
  (ref) => SearchSuggestionNotifier(ref.watch(searchServiceProvider)),
);

class SearchSuggestionNotifier extends StateNotifier<List<SearchSuggestions>> {
  final SearchService searchService;
  SearchSuggestionNotifier(this.searchService) : super([]);
  Future<void> fetchSuggestions(String query) async {
    final suggestions = await searchService.placeSuggestion(query);
    state = suggestions;
  }
}
