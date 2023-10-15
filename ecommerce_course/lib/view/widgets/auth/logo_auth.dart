import 'package:ecommerce_course/core/constant/image_assets.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(ImageAssets.logo,height: 160,);
  }
}
