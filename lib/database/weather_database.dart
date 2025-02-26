import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sqflite/sqflite.dart';

final weatherDataBaseProvider = FutureProvider<Database>((ref) async {
  final dbPath = await getApplicationDocumentsDirectory();
  String pathDirectory = join(dbPath.path, 'weather.db');
  await deleteDatabase(pathDirectory);
  return openDatabase(
    pathDirectory,
    version: 1,
    onCreate: (db, version) {
      db.execute('''
            CREATE TABLE weatherTable(
            weatherID INTEGER PRIMARY KEY AUTOINCREMENT,
            cityName TEXT NOT NULL,
            country TEXT NOT NULL,
            lat REAL,
            lon REAL,
            temperature REAL,
            tempMin REAL,
            tempMax REAL,
            humidity INTEGER,
            windSpeed REAL,
            windDeg INTEGER,
            description TEXT,
            cloudCoverage INTEGER,
            pressure INTEGER,
            sunrise INTEGER,
            sunset INTEGER,
            currentTime INTEGER,
            timezone INTEGER
              )
''');
    },
  );
});



