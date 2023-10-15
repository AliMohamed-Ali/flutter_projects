import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_color.dart';

class CustomButtonLanguage extends StatelessWidget {
  const CustomButtonLanguage({super.key, this.buttonText, this.onPressed});
  final String? buttonText ;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      color: AppColor.primaryColor,
      margin: const EdgeInsets.symmetric(horizontal: 120,vertical: 10),
      child: MaterialButton(
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text("$buttonText".tr,style: Theme.of(context).textTheme.displayMedium,),
      ),
    );
  }
}
