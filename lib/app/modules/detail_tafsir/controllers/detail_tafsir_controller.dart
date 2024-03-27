import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/tafsir_surah.dart';
import 'package:http/http.dart' as http;

class DetailTafsirController extends GetxController {
 Future<TafsirSurah> getDetailTafsir(int id) async {
    Uri url = Uri.parse(Api.quranUrl + '/tafsir/${id}');
    var res = await http.get(url);

    TafsirSurah data = TafsirSurah.fromJson(json.decode(res.body)['data']);
    return data;
  }
}
