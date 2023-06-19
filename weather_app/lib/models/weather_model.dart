import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherState;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];
    return WeatherModel(
        date:data["location"]["localtime"],
        temp: jsonData["avgtemp_c"],
        minTemp: jsonData["mintemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        weatherState: jsonData["condition"]["text"]);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'tem=$temp min=$minTemp max=$maxTemp date=$date ';
  }

  String getImage() {
    if (weatherState == "Clear" || weatherState == "Sunny") {
      return "assets/images/clear.png";
    } else if (weatherState == "Cloudy" || weatherState == "Partly cloudy") {
      return "assets/images/cloudy.png";
    } else if (weatherState == "Thunderstorm" || weatherState == "Thunder") {
      return "assets/images/thunderstorm.png";
    } else if (weatherState == "Rain" ||
        weatherState == "Heavy Rain" ||
        weatherState == "Light Rain" ||
        weatherState == "Showers" ||
        weatherState == "Moderate rain") {
      return "assets/images/rainy.png";
    } else if (weatherState == "Snow" || weatherState == "Sleet") {
      return "assets/images/rainy.png";
    } else {
      return "assets/images/clear.png";
    }
  }

  MaterialColor getColorTheme() {
    if (weatherState == "Clear" || weatherState == "Sunny") {
      return Colors.orange;
    } else if (weatherState == "Cloudy" || weatherState == "Partly cloudy") {
      return Colors.blue;
    } else if (weatherState == "Thunderstorm" || weatherState == "Thunder") {
      return Colors.blueGrey;
    } else if (weatherState == "Rain" ||
        weatherState == "Heavy Rain" ||
        weatherState == "Light Rain" ||
        weatherState == "Showers" ||
        weatherState == "Moderate rain") {
      return Colors.blue;
    } else if (weatherState == "Snow" || weatherState == "Sleet") {
      return Colors.yellow;
    } else {
      return Colors.orange;
    }
  }
}
