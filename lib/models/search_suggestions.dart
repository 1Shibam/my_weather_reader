class SearchSuggestions {
  String? displayName;
  String? lat;
  String? lon;

  SearchSuggestions({this.displayName, this.lat, this.lon});

  SearchSuggestions.fromJson(Map<String, dynamic> json) {
    displayName = json["display_name"];
    lat = json["lat"];
    lon = json["lon"];
  }

  static List<SearchSuggestions> fromList(List<Map<String, dynamic>> list) {
    return list.map(SearchSuggestions.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "display_name": displayName,
      "lat": lat,
      "lon": lon,
    };
  }

  // Override toString method to display custom output
  @override
  String toString() {
    return 'SearchSuggestions(displayName: $displayName, lat: $lat, lon: $lon)';
  }
}
