import 'package:get/get.dart';

import '../controllers/shalat_controller.dart';

class ShalatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShalatController>(
      () => ShalatController(),
    );
  }
}
