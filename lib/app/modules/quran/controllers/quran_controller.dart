import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/date_hijri.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class QuranController extends GetxController {
  RxString username = ''.obs;
  final box = GetStorage();
  Rx<DateHijri> dateHijri = DateHijri().obs;


  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse("${Api.quranUrl}/surat");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  void getUsername() {
    if (username.value == '') {
      if (box.read('username') != null) {
        username.value = box.read('username');
        update(['username']);
      } else {
        username.value = '';
      }
    }
  }

  Future<void> getDateNow() async {
    var dateNow = DateFormat('yyyy/M/d').format(DateTime.now());
    Uri url = Uri.parse("${Api.altDateHijriUrl}/$dateNow");
    var res = await http.get(url);
    dateHijri.value = DateHijri.fromJson(json.decode(res.body));
  }

  @override
  void onInit() {
    getDateNow();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
