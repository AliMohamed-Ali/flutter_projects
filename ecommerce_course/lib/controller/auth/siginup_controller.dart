import 'package:ecommerce_course/core/constant/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
  signup();
  directToSignIn();
}

class SignUpControllerImpl extends SignUpController{
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phone;
  @override
  directToSignIn() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  signup() {

  }
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    userName = TextEditingController();
    phone = TextEditingController();

    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
    phone.dispose();
    super.dispose();
  }
}