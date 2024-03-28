import 'dart:convert';

import 'package:holy_quran/app/data/models/tafsir_surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse('https://equran.id/api/v2/tafsir/113');

  var res = await http.get(url);

  // List data = (json.decode(res.body) as Map<String, dynamic>)['data'];
  // Surah data = Surah.fromJson(json.decode(res.body)['data']);
  // print(data.suratSebelumnya?.namaLatin);
  // print(data[0]);
  // Surah alfatiha = Surah.fromJson(data[0]);

  TafsirSurah data = TafsirSurah.fromJson(json.decode(res.body)['data']);
  print(data.tafsir[0].teks);

  // print(alfatiha.nama);
}
