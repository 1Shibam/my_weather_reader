import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sqflite/sqflite.dart';

final weatherDataBaseProvider = FutureProvider<Database>((ref) async {
  final dbPath = await getApplicationDocumentsDirectory();
  String pathDirectory = join(dbPath.path, 'weather.db');

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

/*
factory WeatherModel.fromDBMap(Map<String, dynamic> map) {
  return WeatherModel(
    weatherId: map['weatherID'] as int?,
    cityName: map['cityName'] as String,
    country: map['country'] as String,
    latitude: (map['lat'] as num).toDouble(),
    longitude: (map['lon'] as num).toDouble(),
    temperature: (map['temperature'] as num).toDouble(),
    minTemperature: (map['tempMin'] as num).toDouble(),
    maxTemperature: (map['tempMax'] as num).toDouble(),
    humidity: map['humidity'] as int,
    windSpeed: (map['windSpeed'] as num).toDouble(),
    windDeg: map['windDeg'] as int,
    description: map['description'] as String,
    cloudCoverage: map['cloudCoverage'] as int,
    pressure: map['pressure'] as int,
    sunrise: map['sunrise'] as int,
    sunset: map['sunset'] as int,
    currentTime: map['currentTime'] as int,
    timezone: map['timezone'] as int,
  );
}
  Map<String, dynamic> to
 */
