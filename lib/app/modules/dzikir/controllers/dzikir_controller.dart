import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/asmaul_husna.dart';
import 'package:http/http.dart' as http;

class DzikirController extends GetxController {
RxList<dynamic> listDzikir = <dynamic>[
    {
      'title': 'Pagi',
      'icon': 'assets/morning.png',
      'slug': '/pagi',
    },
    {
      'title': 'Sore',
      'icon': 'assets/afternoon.png',
      'url': '/sore',
    },
    {
      'title': 'Shalat',
      'icon': 'assets/praying.png',
      'url': '/solat',
    },
  ].obs;
  Future<List<AsmaulHusna>> getAllAsmaulHusna() async {
    Uri url = Uri.parse(Api.asmaulHusnaUrl);
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => AsmaulHusna.fromJson(e)).toList();
    }
  }
}
