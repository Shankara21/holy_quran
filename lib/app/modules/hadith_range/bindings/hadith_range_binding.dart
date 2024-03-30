import 'package:get/get.dart';

import '../controllers/hadith_range_controller.dart';

class HadithRangeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HadithRangeController>(
      () => HadithRangeController(),
    );
  }
}
