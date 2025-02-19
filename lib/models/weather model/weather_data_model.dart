import 'package:my_weather_reader/models/weather%20model/current_clouds.dart';
import 'package:my_weather_reader/models/weather%20model/current_weather_coords.dart';
import 'package:my_weather_reader/models/weather%20model/main_details.dart';
import 'package:my_weather_reader/models/weather%20model/current_weather.dart';
import 'package:my_weather_reader/models/weather%20model/current_wind.dart';

class WeatherDataModel {
  CurrentWeatherCoords? coord;
  List<CurrentWeather>? weather;
  String? base;
  MainDetails? main;
  int? visibility;
  CurrentWind? wind;
  CurrentClouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherDataModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    if (json["coord"] is Map) {
      coord = json["coord"] == null
          ? null
          : CurrentWeatherCoords.fromJson(json["coord"]);
    }
    if (json["weather"] is List) {
      weather = json["weather"] == null
          ? null
          : (json["weather"] as List)
              .map((e) => CurrentWeather.fromJson(e))
              .toList();
    }
    if (json["base"] is String) {
      base = json["base"];
    }
    if (json["main"] is Map) {
      main = json["main"] == null ? null : MainDetails.fromJson(json["main"]);
    }
    if (json["visibility"] is int) {
      visibility = json["visibility"];
    }
    if (json["wind"] is Map) {
      wind = json["wind"] == null ? null : CurrentWind.fromJson(json["wind"]);
    }
    if (json["clouds"] is Map) {
      clouds = json["clouds"] == null ? null : CurrentClouds.fromJson(json["clouds"]);
    }
    if (json["dt"] is int) {
      dt = json["dt"];
    }
    if (json["sys"] is Map) {
      sys = json["sys"] == null ? null : Sys.fromJson(json["sys"]);
    }
    if (json["timezone"] is int) {
      timezone = json["timezone"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["cod"] is int) {
      cod = json["cod"];
    }
  }

  static List<WeatherDataModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(WeatherDataModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data["coord"] = coord?.toJson();
    }
    if (weather != null) {
      data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    data["base"] = base;
    if (main != null) {
      data["main"] = main?.toJson();
    }
    data["visibility"] = visibility;
    if (wind != null) {
      data["wind"] = wind?.toJson();
    }
    if (clouds != null) {
      data["clouds"] = clouds?.toJson();
    }
    data["dt"] = dt;
    if (sys != null) {
      data["sys"] = sys?.toJson();
    }
    data["timezone"] = timezone;
    data["id"] = id;
    data["name"] = name;
    data["cod"] = cod;
    return data;
  }
}

class Sys {
  int? type;
  int? id;
  String? country;
  int? sunrise;
  int? sunset;

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["sunrise"] is int) {
      sunrise = json["sunrise"];
    }
    if (json["sunset"] is int) {
      sunset = json["sunset"];
    }
  }

  static List<Sys> fromList(List<Map<String, dynamic>> list) {
    return list.map(Sys.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    data["id"] = id;
    data["country"] = country;
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    return data;
  }
}


