import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_weather_reader/core/services/weather_database_service.dart';
import 'package:my_weather_reader/models/weather_data.dart';

class SearchedWeatherLocationList
    extends StateNotifier<List<WeatherDataModel>> {
  final Ref ref;
  SearchedWeatherLocationList(this.ref) : super([]) {
    loadSearchedList();
  }

  //! Load serached List

  Future<void> loadSearchedList() async {
    final searches =
        await ref.read(weatherDatabaseServiceProvider).getSearchedList();
    state = searches;
  }
}
