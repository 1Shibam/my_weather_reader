class SearchSuggestions {
  String? placeId;
  String? osmId;
  String? osmType;
  String? licence;
  String? lat;
  String? lon;
  List<String>? boundingbox;
  String? classType;
  String? type;
  String? displayName;
  String? displayPlace;
  String? displayAddress;
  Address? address;

  SearchSuggestions(
      {this.placeId,
      this.osmId,
      this.osmType,
      this.licence,
      this.lat,
      this.lon,
      this.boundingbox,
      this.classType,
      this.type,
      this.displayName,
      this.displayPlace,
      this.displayAddress,
      this.address});

  SearchSuggestions.fromJson(Map<String, dynamic> json) {
    placeId = json["place_id"];
    osmId = json["osm_id"];
    osmType = json["osm_type"];
    licence = json["licence"];
    lat = json["lat"];
    lon = json["lon"];
    boundingbox = json["boundingbox"] == null
        ? null
        : List<String>.from(json["boundingbox"]);
    classType = json["class"];
    type = json["type"];
    displayName = json["display_name"];
    displayPlace = json["display_place"];
    displayAddress = json["display_address"];
    address =
        json["address"] == null ? null : Address.fromJson(json["address"]);
  }

  static List<SearchSuggestions> fromList(List<Map<String, dynamic>> list) {
    return list.map(SearchSuggestions.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["place_id"] = placeId;
    data["osm_id"] = osmId;
    data["osm_type"] = osmType;
    data["licence"] = licence;
    data["lat"] = lat;
    data["lon"] = lon;
    if (boundingbox != null) {
      data["boundingbox"] = boundingbox;
    }
    data["class"] = classType;
    data["type"] = type;
    data["display_name"] = displayName;
    data["display_place"] = displayPlace;
    data["display_address"] = displayAddress;
    if (address != null) {
      data["address"] = address?.toJson();
    }
    return data;
  }
}

class Address {
  String? name;
  String? country;
  String? countryCode;

  Address({this.name, this.country, this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    country = json["country"];
    countryCode = json["country_code"];
  }

  static List<Address> fromList(List<Map<String, dynamic>> list) {
    return list.map(Address.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["country"] = country;
    data["country_code"] = countryCode;
    return data;
  }
}
