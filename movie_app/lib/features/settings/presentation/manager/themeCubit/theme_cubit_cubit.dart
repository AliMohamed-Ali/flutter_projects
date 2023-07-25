import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeModeOptions { light, dark }

class ThemeCubit extends Cubit<ThemeModeOptions> {
  ThemeCubit() : super(ThemeModeOptions.light);

  void toggleTheme() {
    emit(state == ThemeModeOptions.light ? ThemeModeOptions.dark : ThemeModeOptions.light);
  }
}
