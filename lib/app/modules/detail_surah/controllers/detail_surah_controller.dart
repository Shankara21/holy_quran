import 'dart:convert';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  // buat satu variable untuk menampung data surah
  Rx<Surah> nextSurah = Surah(
    nomor: 0,
    nama: '',
    namaLatin: '',
    jumlahAyat: 0,
    arti: '',
    audioFull: Map(),
    ayat: [],
    tempatTurun: '',
    deskripsi: '',
  ).obs;
  Rx<Surah> prevSurah = Surah(
    nomor: 0,
    nama: '',
    namaLatin: '',
    jumlahAyat: 0,
    arti: '',
    audioFull: Map(),
    ayat: [],
    tempatTurun: '',
    deskripsi: '',
  ).obs;
  Future<Surah> getDetailSurah(int id) async {
    Uri url = Uri.parse(Api.quranUrl + '/surat/${id}');
    var res = await http.get(url);

    Surah data = Surah.fromJson(json.decode(res.body)['data']);
    if (data.suratSelanjutnya != null) {
      Uri urlNext =
          Uri.parse(Api.quranUrl + '/surat/${data.suratSelanjutnya!.nomor}');
      var resNext = await http.get(urlNext);
      Surah resNextSurah = Surah.fromJson(json.decode(resNext.body)['data']);
      nextSurah.value = resNextSurah;
    }

    if (data.suratSebelumnya != null) {
      Uri urlPrev =
          Uri.parse(Api.quranUrl + '/surat/${data.suratSebelumnya!.nomor}');
      var resPrev = await http.get(urlPrev);
      Surah resPrevSurah = Surah.fromJson(json.decode(resPrev.body)['data']);
      prevSurah.value = resPrevSurah;
    }

    return data;
  }
}
