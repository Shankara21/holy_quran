import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/hadith.dart';
import 'package:http/http.dart' as http;

class HadithRangeController extends GetxController {
  Future<Hadith>? getByRange(String params) async {
    Uri url = Uri.parse("${Api.hadithUrl}/$params");
    var res = await http.get(url);

    var data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return Hadith.fromJson(data);
    } else {
      return Hadith.fromJson(data);
    }
  }
}
