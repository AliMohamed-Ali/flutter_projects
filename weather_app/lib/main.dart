import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/cubit_weather_state.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return CubitWeather(WeatherServices());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: BlocProvider.of<CubitWeather>(context)
                .weatherModel
                ?.getColorTheme() ??
            Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
