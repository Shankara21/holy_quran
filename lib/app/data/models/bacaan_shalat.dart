import 'dart:convert';

BacaanShalat bacaanShalatFromJson(String str) =>
    BacaanShalat.fromJson(json.decode(str));

String bacaanShalatToJson(BacaanShalat data) => json.encode(data.toJson());

class BacaanShalat {
  int id;
  String name;
  String arabic;
  String latin;
  String terjemahan;

  BacaanShalat({
    required this.id,
    required this.name,
    required this.arabic,
    required this.latin,
    required this.terjemahan,
  });

  factory BacaanShalat.fromJson(Map<String, dynamic> json) => BacaanShalat(
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
