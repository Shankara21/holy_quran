import 'dart:convert';

Hadith hadithFromJson(String str) => Hadith.fromJson(json.decode(str));

String hadithToJson(Hadith data) => json.encode(data.toJson());

class Hadith {
  String name;
  String id;
  int available;
  int? requested;
  List<Contents>? hadiths;
  Contents? contents;

  Hadith({
    required this.name,
    required this.id,
    required this.available,
    this.requested,
    this.hadiths,
    this.contents,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) => Hadith(
        name: json["name"],
        id: json["id"],
        available: json["available"],
        requested: json["requested"],
        hadiths: (json["hadiths"] as List<dynamic>?)
            ?.map((x) => Contents.fromJson(x as Map<String, dynamic>))
            .toList(),
        contents: json["contents"] != null
            ? Contents.fromJson(json["contents"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "available": available,
        "requested": requested,
        "hadiths": hadiths != null
            ? List<dynamic>.from(hadiths!.map((x) => x.toJson()))
            : null,
        "contents": contents?.toJson(),
      };
}

class Contents {
  int number;
  String arab;
  String id;

  Contents({
    required this.number,
    required this.arab,
    required this.id,
  });

  factory Contents.fromJson(Map<String, dynamic> json) => Contents(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
      };
}
