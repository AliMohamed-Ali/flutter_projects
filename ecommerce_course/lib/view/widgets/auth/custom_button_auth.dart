import 'package:flutter/material.dart';

import '../../../core/constant/app_color.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({super.key, required this.buttonText, this.onPressed});
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColor.primaryColor,
        padding:const EdgeInsets.symmetric
          (vertical: 15),
        child: Text(buttonText),
      ),
    );
  }
}
