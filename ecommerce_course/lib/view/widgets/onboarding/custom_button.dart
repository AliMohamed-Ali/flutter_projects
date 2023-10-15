import 'package:ecommerce_course/controller/onboarding_controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnboarding extends GetView<OnboardingControllerImp> {
  const CustomButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        child: const Text("Continue"),
      ),
    );
  }
}
