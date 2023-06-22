import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/cubit_weather_state.dart';

class SearchPage extends StatelessWidget {
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
              BlocProvider.of<CubitWeather>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<CubitWeather>(context).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              label: Text("search"),
              hintText: "Enter Your City",
              border: OutlineInputBorder(),
              suffixIcon: GestureDetector(
                onTap: () async {
                  BlocProvider.of<CubitWeather>(context)
                      .getWeather(cityName: cityName!);
                  BlocProvider.of<CubitWeather>(context).cityName = cityName;
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
