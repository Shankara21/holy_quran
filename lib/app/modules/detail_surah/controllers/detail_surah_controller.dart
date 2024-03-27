import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<Surah> getDetailSurah(int id) async {
    Uri url = Uri.parse(Api.quranUrl + '/surat/${id}');
    var res = await http.get(url);

    Surah data = Surah.fromJson(json.decode(res.body)['data']);
    return data;
  }
}
