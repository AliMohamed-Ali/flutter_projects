import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap,this.buttonColor, required this.buttonText});
  String buttonText;
  Color? buttonColor;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        margin: EdgeInsets.symmetric(vertical: 8),
        height: 40,
        width: double.infinity,
        child: Center(child: Text(buttonText)),
      ),
    );
  }
}
