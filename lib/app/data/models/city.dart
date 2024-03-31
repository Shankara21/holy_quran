import 'dart:convert';

City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  Coordinate coordinate;
  String id;
  String name;
  String slug;
  String provinceId;

  City({
    required this.coordinate,
    required this.id,
    required this.name,
    required this.slug,
    required this.provinceId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        coordinate: Coordinate.fromJson(json["coordinate"]),
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        provinceId: json["provinceId"],
      );

  Map<String, dynamic> toJson() => {
        "coordinate": coordinate.toJson(),
        "id": id,
        "name": name,
        "slug": slug,
        "provinceId": provinceId,
      };
}

class Coordinate {
  double latitude;
  double longitude;

  Coordinate({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
