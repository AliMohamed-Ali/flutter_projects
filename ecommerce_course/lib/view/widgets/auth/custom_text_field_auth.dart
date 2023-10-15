import 'package:flutter/material.dart';
class CustomTextFieldAuth extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  const CustomTextFieldAuth({super.key, required this.labelText, required this.hintText, required this.icon, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(horizontal: 30,
                vertical: 5),
            suffixIcon:  Icon(icon),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 12),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(labelText),),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            )
        ),
      ),
    );
  }
}