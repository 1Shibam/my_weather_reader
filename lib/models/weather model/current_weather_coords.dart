class CurrentWeatherCoords {
  double? lon;
  double? lat;

  CurrentWeatherCoords({this.lon, this.lat});

  CurrentWeatherCoords.fromJson(Map<String, dynamic> json) {
    if (json["lon"] is double) {
      lon = json["lon"];
    }
    if (json["lat"] is double) {
      lat = json["lat"];
    }
  }

  static List<CurrentWeatherCoords> fromList(List<Map<String, dynamic>> list) {
    return list.map(CurrentWeatherCoords.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["lon"] = lon;
    data["lat"] = lat;
    return data;
  }
}
