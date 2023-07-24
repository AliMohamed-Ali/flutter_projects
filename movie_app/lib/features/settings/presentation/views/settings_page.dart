import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsViewTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark Mode'),
            value: false,
            onChanged: (value){},
          ),
          // Implement the complaints form
          // For example, a form with text fields for name, email, and complaint message
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(labelText: 'Complaint Message'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
