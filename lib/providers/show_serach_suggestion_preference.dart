import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowSearchSuggestionNotifier extends StateNotifier<bool> {
  ShowSearchSuggestionNotifier() : super(true) {
    loadSearchState();
  }
  Future<void> loadSearchState() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('isSearchSuggestionEnabled') ?? true;
  }

  Future<void> setSerachState(bool value) async {
    state = value;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSearchSuggestionEnabled', value);
  }
}

final searchSuggestionEnableProvider =
    StateNotifierProvider<ShowSearchSuggestionNotifier, bool>(
        (ref) => ShowSearchSuggestionNotifier());
