import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;


  List<Map<String, dynamic>> itemNavbar = [
    {
      'title': 'Quran',
      'icon': 'assets/quran_icon.png',
    },
    {
      'title': 'Sholat',
      'icon': 'assets/pray_icon.png',
    },
    {
      'title': 'Setting',
      'icon': 'assets/settings_icon.png',
    },
  ];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
