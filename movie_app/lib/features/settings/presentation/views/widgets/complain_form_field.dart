import 'package:flutter/material.dart';

class ComplaintFormField extends StatelessWidget {
  final TextEditingController controller;

  const ComplaintFormField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {},
      decoration: const InputDecoration(labelText: 'Complaint Message'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your complaint message';
        }
        return null;
      },
    );
  }
}
