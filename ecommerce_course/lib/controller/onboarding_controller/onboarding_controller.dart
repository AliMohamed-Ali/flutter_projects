import 'package:ecommerce_course/core/constant/app_routes.dart';
import 'package:ecommerce_course/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChange(int index);
}

class OnboardingControllerImp extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;
  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
