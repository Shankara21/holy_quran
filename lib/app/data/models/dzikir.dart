import 'dart:convert';

Dzikir dzikirFromJson(String str) => Dzikir.fromJson(json.decode(str));

String dzikirToJson(Dzikir data) => json.encode(data.toJson());

class Dzikir {
  String arab;
  String indo;
  String type;
  String ulang;

  Dzikir({
    required this.arab,
    required this.indo,
    required this.type,
    required this.ulang,
  });

  factory Dzikir.fromJson(Map<String, dynamic> json) => Dzikir(
        arab: json["arab"],
        indo: json["indo"],
        type: json["type"],
        ulang: json["ulang"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "indo": indo,
        "type": type,
        "ulang": ulang,
      };
}
