class CurrentClouds {
  int? all;

  CurrentClouds({this.all});

  CurrentClouds.fromJson(Map<String, dynamic> json) {
    if (json["all"] is int) {
      all = json["all"];
    }
  }

  static List<CurrentClouds> fromList(List<Map<String, dynamic>> list) {
    return list.map(CurrentClouds.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["all"] = all;
    return data;
  }
}