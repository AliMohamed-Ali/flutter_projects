import 'package:flutter/material.dart';
import 'package:movie_app/features/settings/presentation/views/widgets/table_compolaint.dart';

import '../../../data/model/complaint_model.dart';
import 'dark_mode_switch.dart';
import 'email_form_field.dart';
import 'name_form_field.dart';
import 'complain_form_field.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({Key? key}) : super(key: key);

  @override
  State<SettingsViewBody> createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _complainController = TextEditingController();
  final List<ComplaintData> _complaintsList = [];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _complainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            ComplaintFormField(controller: _complainController),
            ElevatedButton(
              onPressed: () {
                checkValidation(_formKey, _nameController, _emailController,
                    context, _complainController);
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            TableOfComplaint(complaintsList: _complaintsList)
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
      final complaint = _complainController.text;
      // Show the Snackbar with the form data
      setState(() {
        _complaintsList.add(ComplaintData(
          name: name,
          email: email,
          complaint: complaint,
        ));
      });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Name: $name, Email: $email'),
      //   ),
      // );
      // Clear the form fields
      _nameController.clear();
      _emailController.clear();
      _complainController.clear();
    }
  }
}
