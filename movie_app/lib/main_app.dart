import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/repos/home_impl_repo.dart';
import 'package:movie_app/features/home/presentation/manager/intheaterMovie/in_theater_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/topRatingMovie/top_rating_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/trendingMovie/trending_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/views/home_tab_view.dart';
import 'package:movie_app/features/search/data/repos/search_impl_repo.dart';
import 'package:movie_app/features/search/presentation/manager/cubit/search_movie_cubit.dart';
import 'package:movie_app/features/search/presentation/views/search_page.dart';
import 'package:movie_app/features/settings/presentation/views/settings_page.dart';

import 'core/utils/service_locator.dart';
import 'features/home/presentation/manager/upcommingMovie/upcomming_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
        body:const TabBarView(children: [
           HomeTabView(),
           SearchTabView(),
          SettingsViewTab(),
        ]),
      ),
    );
  }
}
