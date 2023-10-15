import 'package:ecommerce_course/core/constant/app_routes.dart';
import 'package:ecommerce_course/view/screen/auth/login.dart';
import 'package:ecommerce_course/view/screen/auth/signup.dart';
import 'package:ecommerce_course/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes ={
  AppRoutes.login :(p0) =>const  Login(),
  AppRoutes.signup :(p0) =>const  SignUp(),
  AppRoutes.onboarding: (p0) => const Onboarding(),
};