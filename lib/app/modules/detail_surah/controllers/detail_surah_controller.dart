import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/ayat.dart';
import 'package:holy_quran/app/data/models/surah.dart';
import 'package:holy_quran/app/data/models/tafsir_surah.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

class DetailSurahController extends GetxController {
  final player = AudioPlayer();
  RxString audioStatus = 'stop'.obs;
  RxBool isLoading = false.obs;
  Ayat? lastAyat;
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

  Future<TafsirSurah> getDetailTafsir(int id) async {
    Uri url = Uri.parse(Api.quranUrl + '/tafsir/${id}');
    var res = await http.get(url);

    TafsirSurah data = TafsirSurah.fromJson(json.decode(res.body)['data']);
    return data;
  }

  void playAudioSurah(Surah surah) async {
    if (surah.audioFull['01'] != null) {
      try {
        audioStatus.value = 'fetching';
        await player.stop();
        await player.setUrl(surah.audioFull['01']!);
        audioStatus.value = 'play';
        isLoading.value = false;
        await player.play();
        audioStatus.value = 'stop';
        await player.stop();
        isLoading.value = false;
      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: 'Terjadi Kesahalan',
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: "Connection aborted ${e.message.toString()}",
        );
      } catch (e) {
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Tidak dapat memutar audio.',
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Audio tidak ditemukan',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void pauseAudioSurah() async {
    try {
      await player.pause();
      audioStatus.value = 'pause';
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesahalan',
        middleText: e.message.toString(),
      );
    }
  }

  void resumeAudioSurah() async {
    try {
      audioStatus.value = 'play';
      await player.play();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesahalan',
        middleText: e.message.toString(),
      );
    }
  }

  void stopAudioSurah() async {
    try {
      await player.stop();
      audioStatus.value = 'stop';
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesahalan',
        middleText: e.message.toString(),
      );
    }
  }

  void playAudio(Ayat ayat) async {
    if (ayat.audio['01'] != null) {
      try {
        // if (lastAyat == null) {
        //   lastAyat = ayat;
        // }
        lastAyat ??= ayat;
        lastAyat!.audioStatus = 'stop';
        lastAyat = ayat;
        ayat.audioStatus = 'stop';
        update();
        await player.stop();
        await player.setUrl(ayat.audio['01']!);
        ayat.audioStatus = 'play';
        update();
        await player.play();
        ayat.audioStatus = 'stop';
        update();
        await player.stop();
      } on PlayerException catch (e) {
        Get.defaultDialog(
          title: 'Terjadi Kesahalan',
          middleText: e.message.toString(),
        );
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: "Connection aborted ${e.message.toString()}",
        );
      } catch (e) {
        Get.defaultDialog(
          title: 'Terjadi Kesalahan',
          middleText: 'Tidak dapat memutar audio.',
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Audio tidak ditemukan',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void pauseAudio(Ayat ayat) async {
    try {
      await player.pause();
      ayat.audioStatus = 'pause';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesahalan',
        middleText: e.message.toString(),
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: "Connection aborted ${e.message.toString()}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Tidak dapat pause audio.',
      );
    }
  }

  void resumeAudio(Ayat ayat) async {
    try {
      ayat.audioStatus = 'play';
      update();
      await player.play();
      ayat.audioStatus = 'stop';
      update();
      await player.stop();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesahalan',
        middleText: e.message.toString(),
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: "Connection aborted ${e.message.toString()}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Tidak dapat resume audio.',
      );
    }
  }

  void stopAudio(Ayat ayat) async {
    try {
      await player.stop();
      ayat.audioStatus = 'stop';
      update();
    } on PlayerException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesahalan',
        middleText: e.message.toString(),
      );
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: "Connection aborted ${e.message.toString()}",
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Tidak dapat stop audio.',
      );
    }
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
