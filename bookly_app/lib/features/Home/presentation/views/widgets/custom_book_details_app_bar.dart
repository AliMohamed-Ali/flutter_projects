import 'package:flutter/material.dart';

class CustomBookDetailAppBar extends StatelessWidget {
  const CustomBookDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.close),
          Icon(Icons.shopping_cart),
        ],
      ),
    );
  }
}
