
class ForecastCityModel {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  ForecastCityModel({this.id, this.name, this.coord, this.country, this.population, this.timezone, this.sunrise, this.sunset});

  ForecastCityModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["coord"] is Map) {
      coord = json["coord"] == null ? null : Coord.fromJson(json["coord"]);
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["population"] is int) {
      population = json["population"];
    }
    if(json["timezone"] is int) {
      timezone = json["timezone"];
    }
    if(json["sunrise"] is int) {
      sunrise = json["sunrise"];
    }
    if(json["sunset"] is int) {
      sunset = json["sunset"];
    }
  }

  static List<ForecastCityModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ForecastCityModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    if(coord != null) {
      data["coord"] = coord?.toJson();
    }
    data["country"] = country;
    data["population"] = population;
    data["timezone"] = timezone;
    data["sunrise"] = sunrise;
    data["sunset"] = sunset;
    return data;
  }
}

class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    if(json["lat"] is double) {
      lat = json["lat"];
    }
    if(json["lon"] is double) {
      lon = json["lon"];
    }
  }

  static List<Coord> fromList(List<Map<String, dynamic>> list) {
    return list.map(Coord.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lat"] = lat;
    data["lon"] = lon;
    return data;
  }
}