import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/bacaan_shalat.dart';
import 'package:holy_quran/app/data/models/niat_shalat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShalatController extends GetxController {
  Future<List<NiatShalat>> getAllNiatShalat() async {
    Uri url = Uri.parse("${Api.niatSholatUrl}");
    var res = await http.get(url);

    List data = (json.decode(res.body));

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => NiatShalat.fromJson(e)).toList();
    }
  }

  Future<List<BacaanShalat>> getAllBacaanShalat() async {
    Uri url = Uri.parse("${Api.bacaanSholatUrl}");
    var res = await http.get(url);
    List data = (json.decode(res.body));

    if (data.isEmpty) {
      return [];
    }else {
      return data.map((e) => BacaanShalat.fromJson(e)).toList();
    }
  }
}
