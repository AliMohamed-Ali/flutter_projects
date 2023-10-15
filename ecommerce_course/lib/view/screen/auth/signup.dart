import 'package:ecommerce_course/core/constant/app_color.dart';
import 'package:ecommerce_course/core/constant/app_routes.dart';
import 'package:ecommerce_course/view/widgets/auth/custom_button_auth.dart';
import 'package:ecommerce_course/view/widgets/auth/custom_text_field_auth.dart';
import 'package:ecommerce_course/view/widgets/auth/custom_text_signup_signin.dart';
import 'package:ecommerce_course/view/widgets/auth/post_text_auth.dart';
import 'package:ecommerce_course/view/widgets/auth/title_text_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/siginup_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImpl controllerImpl = Get.put(SignUpControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        title: Text(
          "Sign Up",
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
              controller: controllerImpl.email,
            ),
             CustomTextFieldAuth(
                labelText: "UserName",
                hintText: "Enter "
                    "your "
                    "Name",
                icon: Icons.person_2_outlined,
               controller: controllerImpl.userName,

             ),
             CustomTextFieldAuth(
                labelText: "Phone",
                hintText: "Enter "
                    "your "
                    "Phone",
                icon: Icons.phone_android_outlined,
               controller: controllerImpl.phone,

             ),
             CustomTextFieldAuth(
                labelText: "Password",
                hintText: "Enter your"
                    " Email",
                icon: Icons.lock_outline,
               controller: controllerImpl.password,

             ),
            CustomButtonAuth(
              buttonText: "Sing Up",
              onPressed: ()=>controllerImpl.signup(),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextSignUpOrSignIn(
                textOne: "I have an account?",
                textTwo: "SingIn",
                onTap: ()=>controllerImpl.directToSignIn()  )
          ],
        ),
      ),
    );
  }
}
