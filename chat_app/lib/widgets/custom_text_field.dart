import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.label = ""});
  String? hintText;
  bool? obscureText;
  String? label;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: obscureText!,
        validator: (value) {
          if (value!.isEmpty) {
            return "field is required";
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
            label: Text(label!),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
