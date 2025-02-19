class MainDetails {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  MainDetails({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity, this.seaLevel, this.grndLevel});

  MainDetails.fromJson(Map<String, dynamic> json) {
    if(json["temp"] is double) {
      temp = json["temp"];
    }
    if(json["feels_like"] is double) {
      feelsLike = json["feels_like"];
    }
    if(json["temp_min"] is double) {
      tempMin = json["temp_min"];
    }
    if(json["temp_max"] is double) {
      tempMax = json["temp_max"];
    }
    if(json["pressure"] is int) {
      pressure = json["pressure"];
    }
    if(json["humidity"] is int) {
      humidity = json["humidity"];
    }
    if(json["sea_level"] is int) {
      seaLevel = json["sea_level"];
    }
    if(json["grnd_level"] is int) {
      grndLevel = json["grnd_level"];
    }
  }

  static List<MainDetails> fromList(List<Map<String, dynamic>> list) {
    return list.map(MainDetails.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["temp"] = temp;
    data["feels_like"] = feelsLike;
    data["temp_min"] = tempMin;
    data["temp_max"] = tempMax;
    data["pressure"] = pressure;
    data["humidity"] = humidity;
    data["sea_level"] = seaLevel;
    data["grnd_level"] = grndLevel;
    return data;
  }
}