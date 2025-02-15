import 'package:my_weather_reader/core/services/search_service.dart';
import 'package:my_weather_reader/models/search_suggestions.dart';
import 'package:riverpod/riverpod.dart';

/*
final searchServiceProvider = Provider<SearchService>((ref) => SearchService());

final searchSuggestionsProvider =
    StateNotifierProvider<SearchSuggestionNotifier, List<SearchSuggestions>>(
  (ref) => SearchSuggestionNotifier(ref.watch(searchServiceProvider)),
);

class SearchSuggestionNotifier extends StateNotifier<List<SearchSuggestions>> {
  final SearchService searchService;

//! some suggestion that will be already there -
  static List<SearchSuggestions> popularPlaces = [
    SearchSuggestions(
        displayName: 'New York City, USA', lat: 40.7128, lon: -74.0060),
    SearchSuggestions(displayName: 'London, UK', lat: 51.5074, lon: -0.1278),
    SearchSuggestions(displayName: 'Tokyo, Japan', lat: 35.6895, lon: 139.6917),
    SearchSuggestions(displayName: 'Paris, France', lat: 48.8566, lon: 2.3522),
    SearchSuggestions(
        displayName: 'Sydney, Australia', lat: -33.8688, lon: 151.2093),
    SearchSuggestions(
        displayName: 'Cape Town, South Africa', lat: -33.9249, lon: 18.4241),
    SearchSuggestions(
        displayName: 'Rio de Janeiro, Brazil', lat: -22.9068, lon: -43.1729),
    SearchSuggestions(
        displayName: 'Moscow, Russia', lat: 55.7558, lon: 37.6176),
  ];
  SearchSuggestionNotifier(this.searchService) : super(popularPlaces);
  Future<void> fetchSuggestions(String query) async {
    final suggestions = await searchService.placeSuggestion(query);
    state = suggestions;
  }
} */

class SearchSuggestionsNotifier
    extends StateNotifier<AsyncValue<List<SearchSuggestions>>> {
  final SearchService searchService;

  //! Popular search recommendation -
  static List<SearchSuggestions> popularPlaces = [
    SearchSuggestions(
        displayName: 'New York City, USA', lat: 40.7128, lon: -74.0060),
    SearchSuggestions(displayName: 'London, UK', lat: 51.5074, lon: -0.1278),
    SearchSuggestions(displayName: 'Tokyo, Japan', lat: 35.6895, lon: 139.6917),
    SearchSuggestions(displayName: 'Paris, France', lat: 48.8566, lon: 2.3522),
    SearchSuggestions(
        displayName: 'Sydney, Australia', lat: -33.8688, lon: 151.2093),
    SearchSuggestions(
        displayName: 'Cape Town, South Africa', lat: -33.9249, lon: 18.4241),
    SearchSuggestions(
        displayName: 'Rio de Janeiro, Brazil', lat: -22.9068, lon: -43.1729),
    SearchSuggestions(
        displayName: 'Moscow, Russia', lat: 55.7558, lon: 37.6176),
  ];
  SearchSuggestionsNotifier(this.searchService)
      : super(AsyncValue.data(popularPlaces));

  Future<void> fetchSuggestions(String query) async {
    if (query.isEmpty) {
      state = AsyncValue.data(popularPlaces);
      return;
    }
    state = const AsyncValue.loading();
    try {
      final suggestions = await searchService.placeSuggestion(query);
      state = AsyncValue.data(suggestions);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

//providers
final searchServiceProvider = Provider<SearchService>((ref) => SearchService());

final searchSuggestionsProvider = StateNotifierProvider.autoDispose<
        SearchSuggestionsNotifier, AsyncValue<List<SearchSuggestions>>>(
    (ref) => SearchSuggestionsNotifier(ref.read(searchServiceProvider)));
