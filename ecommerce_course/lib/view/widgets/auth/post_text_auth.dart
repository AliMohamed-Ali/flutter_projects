import 'package:flutter/material.dart';

class PostTextAuth extends StatelessWidget {
  const PostTextAuth({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(text,style:
      Theme.of(context)
          .textTheme
          .bodyMedium,
        textAlign: TextAlign.center,),
    );
  }
}
