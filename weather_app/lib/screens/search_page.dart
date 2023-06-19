import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

import '../services/weather_services.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (data) {
              cityName = data; 
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices service = WeatherServices();

              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              label: Text("search"),
              hintText: "Enter Your City",
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherServices service = WeatherServices();

                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                  Navigator.pop(context);
                },
                child: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
