import 'dart:convert';

class Landmark {
  final String landmark;
  final double latitude;
  final double longitude;

  Landmark(this.landmark, this.latitude, this.longitude);

  Map<String, dynamic> toMap() {
    return {'landmark': landmark, 'latitude': latitude, 'longitude': longitude};
  }

  static Landmark fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Landmark(map['landmark'], double.parse(map['latitude'].toString()),
        double.parse(map['longitude'].toString()));
  }

  String toJson() => json.encode(toMap());
  static Landmark fromJson(String source) => fromMap(json.decode(source));
}
