import 'package:flutter/material.dart';

import '../../manager/themeCubit/theme_cubit_cubit.dart';
import 'complain_form_field.dart';
import 'dark_mode_switch.dart';
import 'email_form_field.dart';
import 'name_form_field.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _complainController = TextEditingController();

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            DarkModeSwitchTile(),
            // Implement the complaints form
            // For example, a form with text fields for name, email, and complaint message
            NameFormField(controller: _nameController),
            EmailFormField(controller: _emailController),
            ComplaintFormField(
              controller: _complainController,
            ),
            ElevatedButton(
              onPressed: () {
                checkValidation(_formKey, _nameController, _emailController,
                    context, _complainController);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void checkValidation(
      GlobalKey<FormState> _formKey,
      TextEditingController _nameController,
      TextEditingController _emailController,
      BuildContext context,
      TextEditingController _complainController) {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      // Show the Snackbar with the form data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Name: $name, Email: $email'),
        ),
      );
      // Clear the form fields
      _nameController.clear();
      _emailController.clear();
      _complainController.clear();
    }
  }
}
