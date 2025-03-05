import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sqflite/sqflite.dart';
import 'package:weather_reader/database/weather_database.dart';
import 'package:weather_reader/models/weather_model.dart';

class WeatherDatabaseService {
  final Database database;
  WeatherDatabaseService(this.database);

  //! add search to database
  Future<void> addSearchToDB(WeatherModel weatherData) async {
    try {
      await database.insert('weatherTable', weatherData.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (error, stackTrace) {

      debugPrintStack(stackTrace: stackTrace);
      rethrow;
    }
  }

  //! get list of searched location
  Future<List<WeatherModel>> getSearchedList() async {
    final List<Map<String, dynamic>> maps =
        await database.query('weatherTable');

    // 🔍 See what the DB is returning

    return maps.map((json) => WeatherModel.fromDBMap(json)).toList();
  }

  //! delete from search list
  Future<int> deletedSearchedLocation(int id) async {
    return await database
        .delete('weatherTable', where: 'weatherID = ?', whereArgs: [id]);
  }
}

final weatherDatabaseServiceProvider =
    FutureProvider<WeatherDatabaseService>((ref) async {
  final database = await ref.watch(weatherDataBaseProvider.future);
  return WeatherDatabaseService(database);
});
