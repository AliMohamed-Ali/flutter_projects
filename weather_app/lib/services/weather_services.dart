import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "0669de490f564b70a4f34905233105";

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    // try {
    Uri url =
        Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7");
    http.Response response = await http.get(url);
    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    weather = WeatherModel.fromJson(data);
    // } catch (e) {
    //   print(e);
    // }
    return weather;
  }
}
