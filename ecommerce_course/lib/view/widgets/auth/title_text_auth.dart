import 'package:flutter/material.dart';

class TitleTextAuth extends StatelessWidget {
  const TitleTextAuth({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.displayLarge,
      textAlign: TextAlign.center,);
  }
}
