import 'package:ecommerce_course/controller/onboarding_controller/onboarding_controller.dart';
import 'package:ecommerce_course/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlidingOnboarding extends GetView<OnboardingControllerImp> {
  const SlidingOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) => controller.onPageChange(value),
      itemCount: onboardingList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                onboardingList[index].title!,
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                onboardingList[index].imageUrl!,
                // width: 200,
                // height: 250,
                // fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 40,
              ),
              Opacity(
                opacity: .4,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onboardingList[index].content!,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
