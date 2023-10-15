import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  const CustomTextSignUpOrSignIn({super.key, required this.textOne, required this.textTwo, required this.onTap});
final String textOne;
final String textTwo;
final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textOne),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo,
            style:const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}
