import 'package:ecommerce_course/controller/onboarding_controller/onboarding_controller.dart';
import 'package:ecommerce_course/core/constant/app_color.dart';
import 'package:ecommerce_course/view/widgets/onboarding/custom_button.dart';
import 'package:ecommerce_course/view/widgets/onboarding/dotts.dart';
import 'package:ecommerce_course/view/widgets/onboarding/sliding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(

        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Expanded(flex: 3, child: SlidingOnboarding()),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  DottsOnboarding(),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButtonOnboarding(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
