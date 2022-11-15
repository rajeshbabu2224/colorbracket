import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () =>
                // child:controller.lodaing.value
                //     ?  EasyLoading()
                //     :
                ListView.builder(
                    itemCount: controller.employeeList.value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.EMPDETAILS,
                              arguments:
                                  "${controller.employeeList.value[index].id}");
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 10.0,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(controller
                                  .employeeList.value[index].company_logo),
                            ),
                            title: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                "Name:${controller.employeeList.value[index].name}\nID:${controller.employeeList.value[index].id}\nCompany:${controller.employeeList.value[index].company}\nDesignation:${controller.employeeList.value[index].designation}",
                                style: TextStyle(fontSize: 15),
                              ),
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
