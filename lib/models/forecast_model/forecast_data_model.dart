import 'package:my_weather_reader/models/forecast_model/forecast_city_model.dart';
import 'package:my_weather_reader/models/forecast_model/forecast_list.dart';

class ForecastDataModel {
  ForecastCityModel? city;
  List<ForecastList>? forecastList;

  ForecastDataModel({this.city, this.forecastList});

  ForecastDataModel.fromJson(Map<String, dynamic> json) {
    if (json["city"] is Map) {
      city = json["city"] == null ? null : ForecastCityModel.fromJson(json["city"]);
    }
    if (json["list"] is List) {
      forecastList = json["list"] == null
          ? null
          : (json["list"] as List)
              .map((e) => ForecastList.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data["city"] = city?.toJson();
    }
    if (forecastList != null) {
      data["list"] = forecastList?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
