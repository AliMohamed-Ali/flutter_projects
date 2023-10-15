import 'package:ecommerce_course/controller/auth/login_controller.dart';
import 'package:ecommerce_course/core/constant/app_color.dart';
import 'package:ecommerce_course/view/widgets/auth/custom_button_auth.dart';
import 'package:ecommerce_course/view/widgets/auth/custom_text_field_auth.dart';
import 'package:ecommerce_course/view/widgets/auth/custom_text_signup_signin.dart';
import 'package:ecommerce_course/view/widgets/auth/logo_auth.dart';
import 'package:ecommerce_course/view/widgets/auth/post_text_auth.dart';
import 'package:ecommerce_course/view/widgets/auth/title_text_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImpl controller = Get.put(LoginControllerImpl());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          title: Text(
            "Sign In",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
        ),
        body: Container(

          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              const LogoAuth(),
              const SizedBox(
                height: 30,
              ),
              const TitleTextAuth(text: "Welcome back"),
              const SizedBox(
                height: 30,
              ),
              const PostTextAuth(
                  text:
                      "Sign In With Your Email And Password or by Social media"),
              const SizedBox(
                height: 30,
              ),
              CustomTextFieldAuth(
                labelText: "Email",
                hintText: "Enter your "
                    "Email",
                icon: Icons.email_outlined,
                controller: controller.email,
              ),
              CustomTextFieldAuth(
                labelText: "Password",
                hintText: "Enter your"
                    " Email",
                icon: Icons.lock_outline,
                controller: controller.password,
              ),
              const Text(
                "Forget Password",
                textAlign: TextAlign.end,
              ),
              CustomButtonAuth(
                buttonText: "Sing In",
                onPressed: ()=>controller.login(),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextSignUpOrSignIn(
                  textOne: "Don't have an account?",
                  textTwo: "SingUp",
                  onTap: () => controller.directToSignUp(),)
            ],
          ),
        ),
      ),
    );
  }
}
