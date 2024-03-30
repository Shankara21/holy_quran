import 'dart:convert';

import 'package:holy_quran/app/config/api_url.dart';
// import 'package:holy_quran/app/data/models/bacaan_shalat.dart';
// import 'package:holy_quran/app/data/models/hadith.dart';
// import 'package:holy_quran/app/data/models/niat_shalat.dart';

import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("${Api.niatSholatUrl}");

  var res = await http.get(url);

  // List data = (json.decode(res.body) as Map<String, dynamic>)['data'];
  // Surah data = Surah.fromJson(json.decode(res.body)['data']);
  // print(data.suratSebelumnya?.namaLatin);
  // print(data[0]);
  // Surah alfatiha = Surah.fromJson(data[0]);

  // TafsirSurah data = TafsirSurah.fromJson(json.decode(res.body)['data']);
  // print(data.tafsir[0].teks);
  // Doa data = Doa.fromJson(json.decode(res.body)['data'][0]);
  // print(data.arab);
  // print(data.indo);

  // Dzikir data = Dzikir.fromJson(json.decode(res.body)['data'][0]);
  // print(data.indo);

  // AsmaulHusna data = AsmaulHusna.fromJson(json.decode(res.body)['data'][0]);
  // print(data.latin);

  // Hadith data = Hadith.fromJson(json.decode(res.body)['data']);
  // print(data.contents?.id);

  // BacaanShalat data = BacaanShalat.fromJson(json.decode(res.body)[0]);
  // print(data.terjemahan);

  // NiatShalat data = NiatShalat.fromJson(json.decode(res.body)[0]);
  // print(data.terjemahan);
}
