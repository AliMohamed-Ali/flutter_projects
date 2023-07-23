import 'package:flutter/material.dart';
import 'package:movie_app/features/home/home_page.dart';
import 'package:movie_app/features/search/search_page.dart';
import 'package:movie_app/features/settings/settings_page.dart';

void main() {
  runApp(const PopFlake());
}

class PopFlake extends StatelessWidget {
  const PopFlake({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(" PopFlake"),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  child: Text("Home"),
                ),
                Tab(
                  icon: Icon(Icons.search),
                  child: Text("Search"),
                ),
                Tab(
                  icon: Icon(Icons.settings),
                  child: Text("Setting"),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            HomePage(),
            SearchPage(),
            SettingsPage(),
          ]),
        ),
      ),
    );
  }
}
