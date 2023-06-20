import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.label = "",
    this.input,
  });
  String? hintText;
  bool? obscureText;
  String? label;
  TextInputType? input;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        keyboardType: input,
        obscureText: obscureText!,
        onChanged: onChanged,
        decoration: InputDecoration(
            label: Text(label!),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
