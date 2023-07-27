import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/service_locator.dart';

enum ThemeModeOptions { light, dark }

class ThemeCubit extends Cubit<ThemeModeOptions> {
  ThemeCubit() : super(ThemeModeOptions.light) {
    initializeTheme();
  }

  Future<void> toggleTheme() async {
    final newTheme = state == ThemeModeOptions.light
        ? ThemeModeOptions.dark
        : ThemeModeOptions.light;

    // Save the selected theme mode in SharedPreferences
    final sharedPreferences = await getIt.getAsync<SharedPreferences>();
    await sharedPreferences.setString('themeMode', newTheme.toString());

    emit(newTheme);
  }

  Future<void> initializeTheme() async {
    // Retrieve the saved theme mode from SharedPreferences
    final sharedPreferences = await getIt.getAsync<SharedPreferences>();
    final themeModeString = sharedPreferences.getString('themeMode');
    final initialThemeMode = themeModeString == ThemeModeOptions.dark.toString()
        ? ThemeModeOptions.dark
        : ThemeModeOptions.light;

    emit(initialThemeMode);
  }
}
