import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/dzikir.dart';
import 'package:http/http.dart' as http;

class DzikirByCategoryController extends GetxController {
  Future<List<Dzikir>?>? getAllDzikir(String params) async {
    Uri url = Uri.parse("${Api.dzikirUrl}/$params");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return null;
    } else {
      return data.map((e) => Dzikir.fromJson(e)).toList();
    }
  }
}
