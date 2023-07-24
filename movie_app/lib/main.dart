import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/repos/home_impl_repo.dart';
import 'package:movie_app/features/home/presentation/manager/intheaterMovie/in_theater_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/topRatingMovie/top_rating_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/trendingMovie/trending_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/views/home_tab_view.dart';
import 'package:movie_app/features/search/presentation/views/search_page.dart';
import 'package:movie_app/features/settings/presentation/views/settings_page.dart';
import 'package:movie_app/simble_observer.dart';

import 'core/utils/service_locator.dart';
import 'features/home/presentation/manager/upcommingMovie/upcomming_cubit.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = SimbleObserve();
  runApp(const PopFlake());
}

class PopFlake extends StatelessWidget {
  const PopFlake({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpcommingCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => TrendingMoviesCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => TopRatingCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => InTheaterMovieCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: DefaultTabController(
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
            body: TabBarView(children: [
              HomeTabView(),
              SearchTabView(),
              SettingsViewTab(),
            ]),
          ),
        ),
      ),
    );
  }
}
