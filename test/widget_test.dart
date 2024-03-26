import 'dart:convert';

import 'package:holy_quran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse('https://equran.id/api/v2/surat');

  var res = await http.get(url);

  List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

  print(data[0]);
  Surah alfatiha = Surah.fromJson(data[0]);

  print(alfatiha.nama);
}
