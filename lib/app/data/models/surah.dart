import 'package:holy_quran/app/data/models/ayat.dart';

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  Map<String, String> audioFull;
  List<Ayat>? ayat;
  SuratSenya? suratSelanjutnya;
  SuratSenya? suratSebelumnya;

  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"])
            .map((k, v) => MapEntry<String, String>(k, v)),
        ayat: (json["ayat"] as List<dynamic>?)
            ?.map((x) => Ayat.fromJson(x as Map<String, dynamic>))
            .toList(),
        suratSelanjutnya: json["suratSelanjutnya"] != null
            ? SuratSenya.fromJson(
                json["suratSelanjutnya"]! as Map<String, dynamic>)
            : null,
        suratSebelumnya: json["suratSebelumnya"] != null
            ? SuratSenya.fromJson(
                json["suratSebelumnya"]! as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
        "tempatTurun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audioFull":
            Map.from(audioFull).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ayat": List<dynamic>.from(ayat!.map((x) => x.toJson())),
        "suratSelanjutnya": suratSelanjutnya!.toJson(),
        "suratSebelumnya": suratSebelumnya!.toJson(),
      };
}

class SuratSenya {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;

  SuratSenya({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
  });

  factory SuratSenya.fromJson(Map<String, dynamic> json) => SuratSenya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
      );

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };
}
