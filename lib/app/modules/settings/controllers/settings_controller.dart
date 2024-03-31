import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holy_quran/app/config/api_url.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/data/models/city.dart';
import 'package:holy_quran/app/data/models/province.dart';
import 'package:http/http.dart' as http;

class SettingsController extends GetxController {
  RxBool isDark = true.obs;
  RxString username = ''.obs;
  final box = GetStorage();
  late TextEditingController usernameController;
  RxList<Province> provinces = <Province>[].obs;
  RxList<City> cities = <City>[].obs;
  RxMap<String, dynamic> location = <String, dynamic>{}.obs;

  Future<List<Province>> getAllProvince() async {
    var savedLocation = box.read('location');
    if (savedLocation != null) {
      location.value = savedLocation;
    }
    Uri url = Uri.parse("${Api.locationUrl}/province");
    var res = await http.get(url);
    List data = (json.decode(res.body));
    if (data.isEmpty) {
      return [];
    } else {
      return provinces = data.map((e) => Province.fromJson(e)).toList().obs;
    }
  }

  Future<void> getCities(String provinceId) async {
    Uri url = Uri.parse("${Api.locationUrl}/province/${provinceId}/city");
    var res = await http.get(url);
    List data = (json.decode(res.body));
    if (data.isNotEmpty) {
      cities.assignAll(data.map((e) => City.fromJson(e)).toList());
      update();
    }
  }

  void saveLocation(Map<String, dynamic> location) {
    box.write('location', location);
    Get.back();
    Get.snackbar(
      'Success',
      'Location saved successfully',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void changeTheme() {
    Get.isDarkMode ? Get.changeTheme(lightTheme) : Get.changeTheme(darkTheme);
    isDark.toggle();
    if (Get.isDarkMode) {
      box.remove('darkTheme');
    } else {
      box.write('darkTheme', true);
    }
  }

  void saveUsername() {
    box.write('username', usernameController.text);
    Get.back();
    Get.snackbar(
      'Success',
      'Username saved successfully',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  void onInit() {
    super.onInit();
    isDark.value = box.read('darkTheme') ?? false;
    usernameController = TextEditingController(text: box.read('username'));
    cities.value = [];
  }

  @override
  void onClose() {
    usernameController.dispose();
    super.onClose();
  }
}
