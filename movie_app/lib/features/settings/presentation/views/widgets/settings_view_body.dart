import 'package:flutter/material.dart';

import 'dark_mode_switch.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DarkModeSwitchTile(),
        // Implement the complaints form
        // For example, a form with text fields for name, email, and complaint message
        TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        TextFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Complaint Message'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
