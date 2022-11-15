import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';
import '../../login_model.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController passwordController, emailController;

  var email = '';
  var password = '';
  var loginList = <LoginModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    //Login(emailController, passwordController);
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "validatePassword";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "validateEmail";
    }
    return null;
  }

  // void checkLogin(// String password,
  //     // String email,
  //
  //     )  {
  //   final isValid = formKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   formKey.currentState!.save();
  // }

  Future<void> login(emailController, passwordController) async {
    //await EasyLoading.show();
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      try {
        formKey.currentState!.save();
        final response = await http.get(Uri.parse(
            'https://retoolapi.dev/B13laa/getusers?user_id=$emailController&password=$passwordController'));
        if (response.statusCode == 200) {
          Get.toNamed(Routes.HOME);
        }
      }

      // } else {
      //   formKey.currentState!.save();
      //   Get.toNamed(Routes.HOME);
      //await EasyLoading.dismiss();
      catch (e) {
        // await EasyLoading.dismiss();
        Get.snackbar('Alert', 'Email Id & Password are invalid');
      }
    }
  }

  void clearEditingControllers() {
    passwordController.clear();
    emailController.clear();
  }
}
