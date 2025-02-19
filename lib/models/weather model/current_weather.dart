class CurrentWeather {
  int? id;
  String? main;
  String? description;
  String? icon;

  CurrentWeather({this.id, this.main, this.description, this.icon});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["main"] is String) {
      main = json["main"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["icon"] is String) {
      icon = json["icon"];
    }
  }

  static List<CurrentWeather> fromList(List<Map<String, dynamic>> list) {
    return list.map(CurrentWeather.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["main"] = main;
    data["description"] = description;
    data["icon"] = icon;
    return data;
  }
}
