import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sqflite/sqflite.dart';
import 'package:weather_reader/database/weather_database.dart';
import 'package:weather_reader/models/weather_model.dart';

class WeatherDatabaseService {
  final Database database;
  WeatherDatabaseService(this.database);

  //! add search to database
  Future<int> addSearchToDB(WeatherModel weatherData) async {
    print('it is called lil nigga');
    return await database.insert('weatherTable', weatherData.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //! get list of searched location
  Future<List<WeatherModel>> getSearchedList() async {
    print('you came here as well');
    final maps = await database.query('weatherTable');
    return maps.map((data) => WeatherModel.fromJson(data)).toList();
  }

  //! delete from search list
  Future<int> deletedSearchedLocation(int id) async {
    return await database
        .delete('weatherTable', where: 'weatherID = ?', whereArgs: [id]);
  }
}

final weatherDatabaseServiceProvider = FutureProvider<WeatherDatabaseService>((ref) async {
  final database = await ref.watch(weatherDataBaseProvider.future);
  return WeatherDatabaseService(database);
});

