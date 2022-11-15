import 'package:get/get.dart';

import '../controllers/employeedetails_controller.dart';

class EmployeeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeDetailsController>(
      () => EmployeeDetailsController(),
    );
  }
}
