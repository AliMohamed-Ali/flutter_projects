import 'package:flutter/material.dart';
import '../components/category_item.dart';

class Category extends StatelessWidget {
  Category({this.text, this.color, this.onTap});
  String? text;
  Color? color;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector( //for make any widget to clicking
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.only(left: 16),
        color: color,
        child: Text(
          text!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
