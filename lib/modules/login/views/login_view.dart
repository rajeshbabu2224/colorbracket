import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Email Id",
                    hintText: "Enter the Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  onSaved: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    return controller.validateEmail(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Password",
                    hintText: "Enter the Password",
                  ),
                  //onSubmitted: done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: controller.passwordController,
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    controller.validatePassword(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                ),
                onPressed: () {
                  // LoginController().checkLogin();

                  controller.login(controller.emailController.text.trim(),
                      controller.passwordController.text.trim());
                },
                child:
                    // Text(LocaleKeys.Login.tr()),
                    const Text('Log In'),
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
