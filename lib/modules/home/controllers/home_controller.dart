import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../employee_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var employeeList = <EmployeeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployeeData();
  }

  Future<void> fetchEmployeeData() async {
    await EasyLoading.show();
    try {
      final response = await http
          .get(Uri.parse('https://retoolapi.dev/GFHqAV/getemployees/'));
      if (response.statusCode == 200) {
        employeeList.clear();
        for (int i = 0; i < (jsonDecode(response.body)).length; i++) {
          EmployeeModel employeeModel =
              EmployeeModel.fromJson((jsonDecode(response.body))[i]);
          employeeList.add(employeeModel);
        }
        // update();
      }
    } catch (e) {}
    await EasyLoading.dismiss();
  }
}
