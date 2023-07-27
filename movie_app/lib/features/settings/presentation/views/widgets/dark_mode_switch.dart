import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/themeCubit/theme_cubit_cubit.dart';


class DarkModeSwitchTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);

    return BlocBuilder<ThemeCubit, ThemeModeOptions>(
      builder: (context, themeMode) {
        return SwitchListTile(
          title: const Text('Dark Mode'),
          value: themeMode == ThemeModeOptions.dark,
          onChanged: (value) {
            themeCubit.toggleTheme();
          },
        );
      },
    );
  }
}
