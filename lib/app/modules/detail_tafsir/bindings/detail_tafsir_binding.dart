import 'package:get/get.dart';

import '../controllers/detail_tafsir_controller.dart';

class DetailTafsirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTafsirController>(
      () => DetailTafsirController(),
    );
  }
}
