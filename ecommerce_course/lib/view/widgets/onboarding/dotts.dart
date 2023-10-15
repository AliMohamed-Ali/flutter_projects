import 'package:ecommerce_course/controller/onboarding_controller/onboarding_controller.dart';
import 'package:ecommerce_course/core/constant/app_color.dart';
import 'package:ecommerce_course/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DottsOnboarding extends StatelessWidget {
  const DottsOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (conroller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onboardingList.length,
            (index) => AnimatedContainer(
              width: conroller.currentPage == index ? 20 : 6,
              height: 6,
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
