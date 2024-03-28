import 'package:get/get.dart';

import '../controllers/pray_controller.dart';

class PrayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayController>(
      () => PrayController(),
    );
  }
}
