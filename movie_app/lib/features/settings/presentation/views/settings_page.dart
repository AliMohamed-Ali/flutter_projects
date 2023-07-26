import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../manager/themeCubit/theme_cubit_cubit.dart';

class SettingsViewTab extends StatelessWidget {
  const SettingsViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BlocBuilder<ThemeCubit, ThemeModeOptions>(
            builder: (context, themeMode) {
              return SwitchListTile(
                title: const Text('Dark Mode'),
                value: themeMode == ThemeModeOptions.dark,
                onChanged: (value) {
                  BlocProvider.of<ThemeCubit>(context).toggleTheme();
                },
              );
            },
          ),
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
      ),
    );
  }
}
