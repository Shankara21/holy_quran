import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse(Api.quranUrl + '/surat');
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }
}
