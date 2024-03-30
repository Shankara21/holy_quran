import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/doa.dart';
import 'package:http/http.dart' as http;

class DoaController extends GetxController {
  Future<List<Doa>> getAllDoaHarian() async {
    Uri url = Uri.parse("${Api.doaUrl}/harian");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    }else{
      return data.map((e) => Doa.fromJson(e)).toList();
    }
  }
  Future<List<Doa>> getAllDoaQuran() async {
    Uri url = Uri.parse("${Api.doaUrl}/quran");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    }else{
      return data.map((e) => Doa.fromJson(e)).toList();
    }
  }
  Future<List<Doa>> getAllDoa() async {
    Uri url = Uri.parse("${Api.doaUrl}");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    }else{
      return data.map((e) => Doa.fromJson(e)).toList();
    }
  }
}
