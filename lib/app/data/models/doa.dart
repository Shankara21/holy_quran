import 'dart:convert';

Doa doaFromJson(String str) => Doa.fromJson(json.decode(str));

String doaToJson(Doa data) => json.encode(data.toJson());

class Doa {
  String arab;
  String indo;
  String judul;
  String source;

  Doa({
    required this.arab,
    required this.indo,
    required this.judul,
    required this.source,
  });

  factory Doa.fromJson(Map<String, dynamic> json) => Doa(
        arab: json["arab"],
        indo: json["indo"],
        judul: json["judul"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "indo": indo,
        "judul": judul,
        "source": source,
      };
}
