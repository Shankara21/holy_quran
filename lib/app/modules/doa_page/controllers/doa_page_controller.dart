import 'package:get/get.dart';

class DoaPageController extends GetxController {
  RxList<dynamic> listDoa = <dynamic>[
    {
      'title': 'Doa',
      'icon': 'assets/doa.png',
      'url': '/doa',
    },
    {
      'title': 'Dzikir',
      'icon': 'assets/dzikir.png',
      'url': '/dzikir',
    },
    {
      'title': 'Hadith',
      'icon': 'assets/hadith.png',
      'url': '/hadith',
    },
    {
      'title': 'Shalat',
      'icon': 'assets/prayer.png',
      'url': '/shalat',
    },
  ].obs;
}
