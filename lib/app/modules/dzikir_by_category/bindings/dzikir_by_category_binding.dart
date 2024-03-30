import 'package:get/get.dart';

import '../controllers/dzikir_by_category_controller.dart';

class DzikirByCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DzikirByCategoryController>(
      () => DzikirByCategoryController(),
    );
  }
}
