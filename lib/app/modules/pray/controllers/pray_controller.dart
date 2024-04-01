import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/data/models/date_hijri.dart';
import 'package:holy_quran/app/data/models/prayer.dart';
import 'package:holy_quran/app/data/models/prayer_time.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class PrayController extends GetxController {
  Rx<DateTime> timeNow = DateTime.now().obs;
  RxString timeNowString = ''.obs;
  late Timer _timer;
  RxString dateNow = ''.obs;
  Rx<DateHijri> dateHijri = DateHijri().obs;
  final box = GetStorage();
  RxMap<String, dynamic> location = <String, dynamic>{}.obs;
  RxMap<String, dynamic> prayToday = <String, dynamic>{}.obs;
  RxList<dynamic> listPrayTime = <dynamic>[].obs;
  RxMap<String, dynamic> nextPrayTime = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
    _updateDateNow();
    _updateNextPrayTime();
  }

  void getLocation() {
    var savedLocation = box.read('location');
    if (savedLocation != null) {
      location.value = savedLocation;
      getPrayerTime();
      getDateNow();
      _startTimer();
      _updateDateNow();
      _updateNextPrayTime();
    }
  }

  Future<void> getPrayerTime() async {
    Prayer? prayTimeNow;

    var dateNow = DateFormat('yyyy-M-d').format(DateTime.now());
    Uri url = Uri.parse(
        "${Api.locationUrl}/prayer?latitude=${location['coordinate']['latitude']}&longitude=${location['coordinate']['longitude']}");
    var res = await http.get(url);
    PrayerTime prayTime = PrayerTime.fromJson(json.decode(res.body));
    prayTime.prayers.forEach((element) {
      if (element.date == dateNow) {
        prayTimeNow = element;
      }
    });
    prayToday.value = prayTimeNow!.toJson();
    DateTime now = DateTime.now();
    listPrayTime.clear();
    prayToday['time'].forEach((key, value) {
      String timeNow = DateFormat('HH:mm').format(now);

      DateTime prayerTime = DateFormat('HH:mm').parse(value);
      String prayerTimeNow = DateFormat('HH:mm').format(prayerTime);

      DateTime parsedTimeNow = DateFormat('HH:mm').parse(timeNow);
      DateTime parsedPrayerTimeNow = DateFormat('HH:mm').parse(prayerTimeNow);
      if (parsedPrayerTimeNow.isAfter(parsedTimeNow)) {
        listPrayTime.add({
          'name': key,
          'time': value,
        });
      }
    });
    nextPrayTime.value = listPrayTime.first;
    update();
  }

  void _updateNextPrayTime() {
    if (nextPrayTime.isNotEmpty && nextPrayTime['time'] != null) {
      DateTime prayerTime = DateFormat('HH:mm').parse(nextPrayTime['time']);

      DateTime today = DateTime.now();

      DateTime finalPrayerTime = DateTime(today.year, today.month, today.day,
          prayerTime.hour, prayerTime.minute);

      Duration difference = finalPrayerTime.difference(today);
      if (difference.inSeconds > 0) {
        int hours = difference.inHours;
        int minutes = difference.inMinutes.remainder(60);
        int seconds = difference.inSeconds.remainder(60);

        String formattedHours = hours < 10 ? '0$hours' : '$hours';
        String formattedMinutes = minutes < 10 ? '0$minutes' : '$minutes';
        String formattedSeconds = seconds < 10 ? '0$seconds' : '$seconds';

        nextPrayTime['difference'] = {
          'hours': formattedHours,
          'minutes': formattedMinutes,
          'seconds': formattedSeconds
        };
        update();
      } else {
        getPrayerTime();
      }
    }
  }

  String capitalizeFirst(String s) => s[0].toUpperCase() + s.substring(1);

  Future<void> getDateNow() async {
    var dateNow = DateFormat('yyyy/M/d').format(DateTime.now());
    Uri url = Uri.parse("${Api.altDateHijriUrl}/$dateNow");
    var res = await http.get(url);
    dateHijri.value = DateHijri.fromJson(json.decode(res.body));
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  void _startTimer() {
    if (location.isEmpty) {
      getLocation();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        timeNow(DateTime.now());
        DateTime currentTime = DateTime.now();
        int hour = currentTime.hour;
        int minute = currentTime.minute;
        String formattedHour = hour < 10 ? '0$hour' : '$hour';
        String formattedMinute = minute < 10 ? '0$minute' : '$minute';
        String formattedTime = '$formattedHour:$formattedMinute';
        timeNowString.value = formattedTime;
        if (nextPrayTime.isNotEmpty && nextPrayTime['time'] != null) {
          // getPrayerTime();
          _updateNextPrayTime();
        }
      });
    }
  }

  void _updateDateNow() {
    if (location.isEmpty) {
      getLocation();
    } else {
      final formatter = DateFormat.yMMMMd('en_US');
      dateNow.value = formatter.format(DateTime.now());
    }
  }
}
