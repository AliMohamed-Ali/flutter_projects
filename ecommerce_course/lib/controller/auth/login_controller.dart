import 'package:ecommerce_course/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  directToSignUp();
}

class LoginControllerImpl extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  directToSignUp() {
    Get.toNamed(AppRoutes.signup);
  }

  @override
  login() {}

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
