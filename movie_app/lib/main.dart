import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/details/presentation/views/movie_details_page.dart';
import 'package:movie_app/main_app.dart';
import 'package:movie_app/simble_observer.dart';
import 'core/utils/service_locator.dart';
import 'package:movie_app/features/settings/presentation/manager/themeCubit/theme_cubit_cubit.dart';

void main() {
  
  setupServiceLocator();
  Bloc.observer = SimbleObserve();
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const PopFlake(),
  ));
}



class PopFlake extends StatelessWidget {
  const PopFlake({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeOptions>(
      builder: (context, themeMode) {
        final isDarkTheme = themeMode == ThemeModeOptions.dark;

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            routes: {
              MovieDetailsPage.id: (context) => MovieDetailsPage(),
            },
            home: const MainApp());
      },
    );
  }
}
