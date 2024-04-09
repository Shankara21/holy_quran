import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 2.obs;

  List<Map<String, dynamic>> itemNavbar = [
    {
      'title': 'Quran',
      'icon': 'assets/quran_icon.png',
    },
    {
      'title': 'Doa',
      'icon': 'assets/pray.png',
    },
    {
      'title': 'Shalat',
      'icon': 'assets/pray_icon.png',
    },
    {
      'title': 'Settings',
      'icon': 'assets/settings_icon.png',
    },
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
