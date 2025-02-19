class CurrentWind {
  double? speed;
  int? deg;

  CurrentWind({this.speed, this.deg});

  CurrentWind.fromJson(Map<String, dynamic> json) {
    if (json["speed"] is double) {
      speed = json["speed"];
    }
    if (json["deg"] is int) {
      deg = json["deg"];
    }
  }

  static List<CurrentWind> fromList(List<Map<String, dynamic>> list) {
    return list.map(CurrentWind.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["speed"] = speed;
    data["deg"] = deg;
    return data;
  }
}
