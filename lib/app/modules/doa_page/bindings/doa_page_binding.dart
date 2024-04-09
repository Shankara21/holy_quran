import 'package:get/get.dart';

import '../controllers/doa_page_controller.dart';

class DoaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoaPageController>(
      () => DoaPageController(),
    );
  }
}
