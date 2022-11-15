import 'package:get/get.dart';

import '../controllers/viewmore_controller.dart';

class ViewMoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewMoreController>(
      () => ViewMoreController(),
    );
  }
}
