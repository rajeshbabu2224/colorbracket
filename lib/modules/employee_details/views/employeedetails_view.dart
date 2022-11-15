import 'package:colorbracket/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/employeedetails_controller.dart';

class EmployeeDetailsView extends GetView<EmployeeDetailsController> {
  const EmployeeDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () => ListView.builder(
                itemCount: controller.employeedetailsList.value.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 10.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(controller
                            .employeedetailsList.value[index].company_logo),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "Name:${controller.employeedetailsList.value[index].name}\nID:${controller.employeedetailsList.value[index].id}\nCompany:${controller.employeedetailsList.value[index].company}\nDesignation:${controller.employeedetailsList.value[index].designation}\nInterests:${controller.employeedetailsList.value[index].interests}\nRating:${controller.employeedetailsList.value[index].rating}\nJob Descripton:${controller.employeedetailsList.value[index].job_descripton}",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      subtitle: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          Get.offNamed(Routes.VIEWMORE,
                              arguments: controller
                                  .employeedetailsList.value[index].view_more);
                        },
                        child: const Text(
                          'View More',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
