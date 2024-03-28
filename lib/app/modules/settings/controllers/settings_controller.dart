import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holy_quran/app/config/themes.dart';

class SettingsController extends GetxController {
  RxBool isDark = true.obs;
  RxString username = ''.obs;
  final box = GetStorage();
  late TextEditingController usernameController;

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
    usernameController = TextEditingController(text: box.read('username'));
  }

  @override
  void onClose() {
    usernameController.dispose();
    super.onClose();
  }
}
