import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  final TextEditingController controller;

  const NameFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {},
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }

        return null;
      },
    );
  }
}
