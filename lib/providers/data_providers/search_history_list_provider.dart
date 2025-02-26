import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_reader/models/weather_model.dart';
import 'package:weather_reader/services/weather_database_service.dart';

class SearchHistoryNotifier extends StateNotifier<List<WeatherModel>> {
  final Ref ref;
  SearchHistoryNotifier(this.ref) : super([]) {
    loadSearchedList();
  }

  //! Load searched List
  Future<void> loadSearchedList() async {
    print('load search list is actually working');

    final databaseService = await ref.read(weatherDatabaseServiceProvider.future);

    final searches = await databaseService.getSearchedList();
    state = searches;
  }

  Future<void> addSearch(WeatherModel weatherData) async {
    print('add search to DB is actually working');

    final databaseService = await ref.read(weatherDatabaseServiceProvider.future);
    
    await databaseService.addSearchToDB(weatherData);
    
    await loadSearchedList(); // Reload list after adding
  }

  Future<void> deleteSearchedFromList(int id) async {
    print('delete search from DB is actually working');

    final databaseService = await ref.read(weatherDatabaseServiceProvider.future);
    
    await databaseService.deletedSearchedLocation(id);
    
    await loadSearchedList(); // Reload list after deleting
  }
}

final searchListProvider =
    StateNotifierProvider<SearchHistoryNotifier, List<WeatherModel>>(
        (ref) => SearchHistoryNotifier(ref));
