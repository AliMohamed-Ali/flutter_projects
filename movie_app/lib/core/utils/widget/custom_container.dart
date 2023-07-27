import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 150,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(10),
          child:  Text(
            text,
            style:const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
  }
}