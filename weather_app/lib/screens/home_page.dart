import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubites/cubit_weather_state.dart';
import 'package:weather_app/cubites/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather app"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<CubitWeather, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccessState) {
              return SuccessBody(weatherData: state.weatherModel);
            } else if (state is WeatherFailureState) {
              return Center(
                child: Text("Some thing went Error please try again"),
              );
            } else {
              return InitialBody();
            }
          },
        ));
  }
}

class InitialBody extends StatelessWidget {
  const InitialBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "there is no weather 🤗 start",
            style: TextStyle(fontSize: 24),
          ),
          Text(
            "searching now 🔍",
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class SuccessBody extends StatelessWidget {
  const SuccessBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          weatherData.getColorTheme(),
          weatherData.getColorTheme()[300]!,
          weatherData.getColorTheme()[100]!,
        ],
      )),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(
          flex: 3,
        ),
        Text("${BlocProvider.of<CubitWeather>(context).cityName}",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            )),
        Text(
          "updated: ${weatherData!.date.split(' ')[1]}",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(weatherData!.getImage()),
            Text('${weatherData!.temp.toInt()}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )),
            Column(
              children: [
                Text(
                  "min: ${weatherData!.minTemp.toInt()}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "max: ${weatherData!.maxTemp.toInt()}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        Text(
          weatherData!.weatherState,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(flex: 6)
      ]),
    );
  }
}
