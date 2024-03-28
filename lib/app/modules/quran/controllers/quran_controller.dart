import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

class QuranController extends GetxController {
  RxString username = ''.obs;
  final box = GetStorage();
  Future<List<Surah>> getAllSurah() async {
    username.value = box.read('username');
    update(['username']);
    Uri url = Uri.parse("${Api.quranUrl}/surat");
    var res = await http.get(url);

    List data = (json.decode(res.body) as Map<String, dynamic>)['data'];

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

  late var date = ''.obs;
  Future<dynamic> getHijriDate() async {
    DateTime dateNow = DateTime.now();
    String formattedDate = "${dateNow.day}-${dateNow.month}-${dateNow.year}";
    Uri url = Uri.parse(Api.dateHijriUrl + "/${formattedDate}");
    var res = await http.get(url);
    var rawData = json.decode(res.body)['data']['hijri'];
    var data =
        "${rawData['day']} ${rawData['month']['en']} ${rawData['year']} H";
    date.value = data;
    update();
  }

  @override
  void onInit() {
    getHijriDate();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
