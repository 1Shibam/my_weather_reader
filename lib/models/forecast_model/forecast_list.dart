class ForecastList {

  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;



  String? dtTxt;

  ForecastList(
      {
      this.main,
      this.weather,
      this.clouds,
      this.wind,


      this.dtTxt});

  ForecastList.fromJson(Map<String, dynamic> json) {

    main = json["main"] != null ? Main.fromJson(json["main"]) : null;
    weather = json["weather"] != null
        ? (json["weather"] as List).map((e) => Weather.fromJson(e)).toList()
        : null;
    clouds = json["clouds"] != null ? Clouds.fromJson(json["clouds"]) : null;
    wind = json["wind"] != null ? Wind.fromJson(json["wind"]) : null;

    dtTxt = json["dt_txt"];
  }

  Map<String, dynamic> toJson() {
    return {

      "main": main?.toJson(),
      "weather": weather?.map((e) => e.toJson()).toList(),
      "clouds": clouds?.toJson(),
      "wind": wind?.toJson(),


      "dt_txt": dtTxt,
    };
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json["pod"];
  }

  Map<String, dynamic> toJson() {
    return {"pod": pod};
  }
}

class Wind {
  double? speed;
  int? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json["speed"]?.toDouble();
    deg = json["deg"];
    gust = json["gust"]?.toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      "speed": speed,
      "deg": deg,
      "gust": gust,
    };
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json["all"];
  }

  Map<String, dynamic> toJson() {
    return {"all": all};
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    main = json["main"];
    description = json["description"];
    icon = json["icon"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "main": main,
      "description": description,
      "icon": icon,
    };
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

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.seaLevel,
      this.grndLevel,
      this.humidity,
      this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json["temp"]?.toDouble();
    feelsLike = json["feels_like"]?.toDouble();
    tempMin = json["temp_min"]?.toDouble();
    tempMax = json["temp_max"]?.toDouble();
    pressure = json["pressure"];
    seaLevel = json["sea_level"];
    grndLevel = json["grnd_level"];
    humidity = json["humidity"];
    tempKf = json["temp_kf"]?.toDouble();
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": temp,
      "feels_like": feelsLike,
      "temp_min": tempMin,
      "temp_max": tempMax,
      "pressure": pressure,
      "sea_level": seaLevel,
      "grnd_level": grndLevel,
      "humidity": humidity,
      "temp_kf": tempKf,
    };
  }
}
