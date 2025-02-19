
class ForecastList {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  int? pop;
  Sys? sys;
  String? dtTxt;

  ForecastList({this.dt, this.main, this.weather, this.clouds, this.wind, this.visibility, this.pop, this.sys, this.dtTxt});

  ForecastList.fromJson(Map<String, dynamic> json) {
    if(json["dt"] is int) {
      dt = json["dt"];
    }
    if(json["main"] is Map) {
      main = json["main"] == null ? null : Main.fromJson(json["main"]);
    }
    if(json["weather"] is List) {
      weather = json["weather"] == null ? null : (json["weather"] as List).map((e) => Weather.fromJson(e)).toList();
    }
    if(json["clouds"] is Map) {
      clouds = json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]);
    }
    if(json["wind"] is Map) {
      wind = json["wind"] == null ? null : Wind.fromJson(json["wind"]);
    }
    if(json["visibility"] is int) {
      visibility = json["visibility"];
    }
    if(json["pop"] is int) {
      pop = json["pop"];
    }
    if(json["sys"] is Map) {
      sys = json["sys"] == null ? null : Sys.fromJson(json["sys"]);
    }
    if(json["dt_txt"] is String) {
      dtTxt = json["dt_txt"];
    }
  }

  static List<ForecastList> fromList(List<Map<String, dynamic>> list) {
    return list.map(ForecastList.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["dt"] = dt;
    if(main != null) {
      data["main"] = main?.toJson();
    }
    if(weather != null) {
      data["weather"] = weather?.map((e) => e.toJson()).toList();
    }
    if(clouds != null) {
      data["clouds"] = clouds?.toJson();
    }
    if(wind != null) {
      data["wind"] = wind?.toJson();
    }
    data["visibility"] = visibility;
    data["pop"] = pop;
    if(sys != null) {
      data["sys"] = sys?.toJson();
    }
    data["dt_txt"] = dtTxt;
    return data;
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    if(json["pod"] is String) {
      pod = json["pod"];
    }
  }

  static List<Sys> fromList(List<Map<String, dynamic>> list) {
    return list.map(Sys.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["pod"] = pod;
    return data;
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    if(json["speed"] is double) {
      speed = json["speed"];
    }
    if(json["deg"] is int) {
      deg = json["deg"];
    }
    if(json["gust"] is double) {
      gust = json["gust"];
    }
  }

  static List<Wind> fromList(List<Map<String, dynamic>> list) {
    return list.map(Wind.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["speed"] = speed;
    data["deg"] = deg;
    data["gust"] = gust;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    if(json["all"] is int) {
      all = json["all"];
    }
  }

  static List<Clouds> fromList(List<Map<String, dynamic>> list) {
    return list.map(Clouds.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["all"] = all;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["main"] is String) {
      main = json["main"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["icon"] is String) {
      icon = json["icon"];
    }
  }

  static List<Weather> fromList(List<Map<String, dynamic>> list) {
    return list.map(Weather.fromJson).toList();
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

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  Main({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.seaLevel, this.grndLevel, this.humidity, this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
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
    if(json["sea_level"] is int) {
      seaLevel = json["sea_level"];
    }
    if(json["grnd_level"] is int) {
      grndLevel = json["grnd_level"];
    }
    if(json["humidity"] is int) {
      humidity = json["humidity"];
    }
    if(json["temp_kf"] is double) {
      tempKf = json["temp_kf"];
    }
  }

  static List<Main> fromList(List<Map<String, dynamic>> list) {
    return list.map(Main.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["temp"] = temp;
    data["feels_like"] = feelsLike;
    data["temp_min"] = tempMin;
    data["temp_max"] = tempMax;
    data["pressure"] = pressure;
    data["sea_level"] = seaLevel;
    data["grnd_level"] = grndLevel;
    data["humidity"] = humidity;
    data["temp_kf"] = tempKf;
    return data;
  }
}