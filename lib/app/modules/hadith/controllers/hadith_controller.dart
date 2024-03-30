import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/hadith.dart';
import 'package:http/http.dart' as http;

class HadithController extends GetxController {
  
  Future<List<Hadith>> getAllHadith() async {
    Uri url = Uri.parse("${Api.hadithUrl}");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    }else{
      return data.map((e) => Hadith.fromJson(e)).toList();
    }
  }
}
