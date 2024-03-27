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
        suratSelanjutnya: _parseSurat(json["suratSelanjutnya"]),
        suratSebelumnya: _parseSurat(json["suratSebelumnya"]),
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
  static SuratSenya? _parseSurat(dynamic json) {
    if (json is Map<String, dynamic>) {
      return SuratSenya.fromJson(json);
    } else if (json is bool && !json) {
      return null;
    } else {
      // handle other cases if needed
      return null;
    }
  }
}

class SuratSenya {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;

  SuratSenya({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
  });

  factory SuratSenya.fromJson(dynamic json) {
    if (json is bool) {
      print('json is bool');
      return SuratSenya(
        nomor: 0,
        nama: "",
        namaLatin: "",
        jumlahAyat: 0,
      );
    } else {
      return SuratSenya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "nomor": nomor,
        "nama": nama,
        "namaLatin": namaLatin,
        "jumlahAyat": jumlahAyat,
      };
}
