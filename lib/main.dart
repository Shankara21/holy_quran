import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: box.read('darkTheme') == null ? lightTheme : darkTheme,
      title: "Application",
      initialRoute: Routes.ONBOARDING,
      getPages: AppPages.routes,
    ),
  );
}
