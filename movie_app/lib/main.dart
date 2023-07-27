import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/details/presentation/views/movie_details_page.dart';
import 'package:movie_app/features/home/presentation/views/home_tab_view.dart';
import 'package:movie_app/main_app.dart';
import 'package:movie_app/simble_observer.dart';
import 'core/utils/check_conductivity.dart';
import 'core/utils/service_locator.dart';
import 'package:movie_app/features/settings/presentation/manager/themeCubit/theme_cubit_cubit.dart';

import 'core/utils/widget/no_internet.dart';

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
    return StreamBuilder<bool>(
      stream: ConnectivityUtils.onInternetStatusChange(),
      initialData: true, // Assume there's internet initially
      builder: (context, snapshot) {
        final hasInternet = snapshot.data ?? false;

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
              home: hasInternet
                  ? const MainApp()
                  : const Scaffold(
                      body: NoInternetWidget(),
                    ),
            );
          },
        );
      },
    );
  }
}
