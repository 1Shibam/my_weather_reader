import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_weather_reader/core/database/weather_database.dart';
import 'package:my_weather_reader/models/weather_data.dart';

class SearchedWeatherLocationList  extends StateNotifier<List<WeatherDataModel>>{
  final Ref ref;
  SearchedWeatherLocationList(this.ref) :  super([]){}

  //! Load serached List

  // Future<void> loadSearchedList() async{
  //   await ref.read(weatherDataBaseProvider)
  // }
}