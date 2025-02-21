class WeatherModel {
  final String cityName;
  final double latitude;
  final double longitude;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double windSpeed;
  final int windDeg;
  final String description;
  final int cloudCoverage;
  final int pressure;
  final int sunrise;
  final int sunset;
  final int currentTime;
  final int timezone;

  WeatherModel(
      {required this.cityName,
      required this.latitude,
      required this.longitude,
      required this.temperature,
      required this.minTemperature,
      required this.maxTemperature,
      required this.windSpeed,
      required this.windDeg,
      required this.description,
      required this.cloudCoverage,
      required this.pressure,
      required this.sunrise,
      required this.sunset,
      required this.currentTime,
      required this.timezone});
}

/* db.execute('''
            CREATE TABLE weatherTable(
            weatherID INTEGER PRIMARY KEY AUTOINCREMENT,
            cityName TEXT NOT NULL,
            REAL lat,
            REAL lon,
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
'''); */