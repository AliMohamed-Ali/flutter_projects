import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    updateUi: updateUi,
                  );
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(
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
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  weatherData!.getColorTheme(),
                  weatherData!.getColorTheme()[300]!,
                  weatherData!.getColorTheme()[100]!,
                ],
              )),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(Provider.of<WeatherProvider>(context).cityName!,
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
                        Image.asset(weatherData.getImage()),
                        Text('${weatherData!.temp.toInt()}',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )),
                        Column(
                          children: [
                            Text(
                              "min: ${weatherData.minTemp.toInt()}",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "max: ${weatherData.maxTemp.toInt()}",
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
                      weatherData.weatherState,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 6)
                  ]),
            ),
    );
  }
}
