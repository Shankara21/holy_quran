import 'dart:convert';

import 'package:holy_quran/app/data/models/city.dart';

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  String id;
  String name;
  String slug;
  List<City>? cities;

  Province({
    required this.id,
    required this.name,
    required this.slug,
    this.cities,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        cities: json["cities"] != null
            ? List<City>.from(json["cities"].map((x) => City.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
      };
}
