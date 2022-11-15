import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../employeedetails_model.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailsController extends GetxController {
  var employeedetailsList = <EmployeeDetailsModel>[].obs;
  var isLoading = true.obs;
  var id = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    fetchEmployeeDetailsData();
  }

  Future<void> fetchEmployeeDetailsData() async {
    await EasyLoading.show();
    try {
      final response = await http.get(
          Uri.parse('https://retoolapi.dev/H2F0Ui/getemployedetail?id=$id'));
      if (response.statusCode == 200) {
        employeedetailsList.clear();
        for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
          EmployeeDetailsModel employeedetailsModel =
              EmployeeDetailsModel.fromJson((jsonDecode(response.body))[i]);
          employeedetailsList.add(employeedetailsModel);
        }
        await EasyLoading.dismiss();
        // update();
      }
    } catch (e) {}
  }
}
