import 'package:get/get.dart';

import '../controllers/hadith_by_mahzab_controller.dart';

class HadithByMahzabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HadithByMahzabController>(
      () => HadithByMahzabController(),
    );
  }
}
