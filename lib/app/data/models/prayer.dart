class Prayer {
  Time time;
  String id;
  String date;
  String cityId;

  Prayer({
    required this.time,
    required this.id,
    required this.date,
    required this.cityId,
  });

  factory Prayer.fromJson(Map<String, dynamic> json) => Prayer(
        time: Time.fromJson(json["time"]),
        id: json["id"],
        date: json["date"],
        cityId: json["cityId"],
      );

  Map<String, dynamic> toJson() => {
        "time": time.toJson(),
        "id": id,
        "date": date,
        "cityId": cityId,
      };
}

class Time {
  String imsak;
  String subuh;
  String terbit;
  String dhuha;
  String dzuhur;
  String ashar;
  String maghrib;
  String isya;

  Time({
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        imsak: json["imsak"],
        subuh: json["subuh"],
        terbit: json["terbit"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        ashar: json["ashar"],
        maghrib: json["maghrib"],
        isya: json["isya"],
      );

  Map<String, dynamic> toJson() => {
        "imsak": imsak,
        "subuh": subuh,
        "terbit": terbit,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "ashar": ashar,
        "maghrib": maghrib,
        "isya": isya,
      };
}
