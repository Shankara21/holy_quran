import 'dart:convert';

import 'package:holy_quran/app/data/models/surah.dart';

TafsirSurah tafsirSurahFromJson(String str) =>
    TafsirSurah.fromJson(json.decode(str));

String tafsirSurahToJson(TafsirSurah data) => json.encode(data.toJson());

class TafsirSurah {
  Surah surah;
  List<Tafsir> tafsir;

  TafsirSurah({
    required this.surah,
    required this.tafsir,
  });

  factory TafsirSurah.fromJson(Map<String, dynamic> json) => TafsirSurah(
        surah: Surah.fromJson(json["surah"]),
        tafsir:
            List<Tafsir>.from(json["tafsir"].map((x) => Tafsir.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "surah": surah.toJson(),
        "tafsir": List<dynamic>.from(tafsir.map((x) => x.toJson())),
      };
}

class Tafsir {
  int ayat;
  String teks;

  Tafsir({
    required this.ayat,
    required this.teks,
  });

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        ayat: json["ayat"],
        teks: json["teks"],
      );

  Map<String, dynamic> toJson() => {
        "ayat": ayat,
        "teks": teks,
      };
}
