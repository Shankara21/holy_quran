import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:holy_quran/app/config/themes.dart';
import 'package:holy_quran/app/modules/pray/views/pray_view.dart';
import 'package:holy_quran/app/modules/quran/views/quran_view.dart';
import 'package:holy_quran/app/modules/settings/views/settings_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _body(
          controller.selectedIndex.value,
        ),
      ),
      bottomNavigationBar: _customBottomNavbar(),
    );
  }

  Widget _body(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const QuranView();
      case 1:
        return const PrayView();
      case 2:
        return const SettingsView();
      default:
        return const PrayView();
    }
  }

  Widget _customBottomNavbar() {
    return Obx(
      () => Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            controller.itemNavbar.length,
            (index) => GestureDetector(
              onTap: () => controller.changeTabIndex(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: controller.selectedIndex.value == index
                          ? Colors.blue.withOpacity(0.2)
                          : const Color(0xff6D6C7E).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset(
                      controller.itemNavbar[index]['icon'],
                      width: 30,
                      color: controller.selectedIndex.value == index
                          ? appBlue
                          : appGray,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    controller.itemNavbar[index]['title'],
                    style: TextStyle(
                      fontSize: 12,
                      color: controller.selectedIndex.value == index
                          ? Colors.blue
                          : const Color(0xff6D6C7E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
