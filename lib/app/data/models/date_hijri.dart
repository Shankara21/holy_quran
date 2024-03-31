import 'dart:convert';

DateHijri dateHijriFromJson(String str) => DateHijri.fromJson(json.decode(str));

String dateHijriToJson(DateHijri data) => json.encode(data.toJson());

class DateHijri {
  int? tanggal;
  int? bulan;
  int? tahun;
  String? namabulan;
  String? terbilang;
  String? terbilangsimpel;
  String? terbilangbakdamaghrib;

  DateHijri({
    this.tanggal,
    this.bulan,
    this.tahun,
    this.namabulan,
    this.terbilang,
    this.terbilangsimpel,
    this.terbilangbakdamaghrib,
  });

  factory DateHijri.fromJson(Map<String, dynamic> json) => DateHijri(
        tanggal: json["tanggal"],
        bulan: json["bulan"],
        tahun: json["tahun"],
        namabulan: json["namabulan"],
        terbilang: json["terbilang"],
        terbilangsimpel: json["terbilangsimpel"],
        terbilangbakdamaghrib: json["terbilangbakdamaghrib"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "bulan": bulan,
        "tahun": tahun,
        "namabulan": namabulan,
        "terbilang": terbilang,
        "terbilangsimpel": terbilangsimpel,
        "terbilangbakdamaghrib": terbilangbakdamaghrib,
      };
}
