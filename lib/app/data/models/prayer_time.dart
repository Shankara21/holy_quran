import 'dart:convert';

import 'package:holy_quran/app/data/models/City.dart';
import 'package:holy_quran/app/data/models/prayer.dart';
import 'package:holy_quran/app/data/models/province.dart';

PrayerTime prayerTimeFromJson(String str) =>
    PrayerTime.fromJson(json.decode(str));

String prayerTimeToJson(PrayerTime data) => json.encode(data.toJson());

class PrayerTime {
  Coordinate coordinate;
  String id;
  String name;
  String slug;
  String provinceId;
  Province province;
  List<Prayer> prayers;

  PrayerTime({
    required this.coordinate,
    required this.id,
    required this.name,
    required this.slug,
    required this.provinceId,
    required this.province,
    required this.prayers,
  });

  factory PrayerTime.fromJson(Map<String, dynamic> json) => PrayerTime(
        coordinate: Coordinate.fromJson(json["coordinate"]),
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        provinceId: json["provinceId"],
        province: Province.fromJson(json["province"]),
        prayers:
            List<Prayer>.from(json["prayers"].map((x) => Prayer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coordinate": coordinate.toJson(),
        "id": id,
        "name": name,
        "slug": slug,
        "provinceId": provinceId,
        "province": province.toJson(),
        "prayers": List<dynamic>.from(prayers.map((x) => x.toJson())),
      };
}
