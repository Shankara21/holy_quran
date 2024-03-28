import 'package:get/get.dart';

import '../controllers/detail_of_surah_controller.dart';

class DetailOfSurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailOfSurahController>(
      () => DetailOfSurahController(),
    );
  }
}
