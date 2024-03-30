import 'dart:convert';

NiatShalat niatShalatFromJson(String str) =>
    NiatShalat.fromJson(json.decode(str));

String niatShalatToJson(NiatShalat data) => json.encode(data.toJson());

class NiatShalat {
  int id;
  String name;
  String arabic;
  String latin;
  String terjemahan;

  NiatShalat({
    required this.id,
    required this.name,
    required this.arabic,
    required this.latin,
    required this.terjemahan,
  });

  factory NiatShalat.fromJson(Map<String, dynamic> json) => NiatShalat(
        id: json["id"],
        name: json["name"],
        arabic: json["arabic"],
        latin: json["latin"],
        terjemahan: json["terjemahan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "arabic": arabic,
        "latin": latin,
        "terjemahan": terjemahan,
      };
}
