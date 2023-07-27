import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;

  const EmailFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {},
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        // Add email validation logic here
        // You can use a regular expression to check if the email is valid
        // For example, check if it contains @ and .
        if (!value.contains('@') || !value.contains('.')) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}
