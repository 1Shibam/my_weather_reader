class SearchSuggestions {
  String? displayName;
  double? lat;
  double? lon;

  SearchSuggestions({this.displayName, this.lat, this.lon});

  // Factory constructor for JSON parsing
  SearchSuggestions.fromJson(Map<String, dynamic> json) {
    displayName = json["display_name"];
    lat = double.tryParse(json["lat"].toString()) ??
        0.0; // Handle string to double conversion
    lon = double.tryParse(json["lon"].toString()) ?? 0.0;
  }

  static List<SearchSuggestions> fromList(List<Map<String, dynamic>> list) {
    return list.map((json) => SearchSuggestions.fromJson(json)).toList();
  }

  // To convert the object to a Map for easy serialization
  Map<String, dynamic> toJson() {
    return {
      "display_name": displayName,
      "lat": lat,
      "lon": lon,
    };
  }

  @override
  String toString() {
    return 'SearchSuggestions(displayName: $displayName, lat: $lat, lon: $lon)';
  }
}
