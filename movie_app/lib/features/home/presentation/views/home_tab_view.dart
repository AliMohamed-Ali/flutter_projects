import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/widget/custom_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/intheaterMovie/in_theater_movie_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/topRatingMovie/top_rating_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/trendingMovie/trending_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/upcommingMovie/upcomming_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/home_tab_view_body.dart';

import '../../../../core/utils/check_conductivity.dart';
import '../../../../core/utils/widget/no_internet.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  void initState() {
    BlocProvider.of<TrendingMoviesCubit>(context).fetchTrendingMovie();
    BlocProvider.of<UpcommingCubit>(context).fetchUpcommingMovie();
    BlocProvider.of<TopRatingCubit>(context).fetchTopRatedMovie();
    BlocProvider.of<InTheaterMovieCubit>(context).fetchInTheaterMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: ConnectivityUtils.hasInternetConnection(),
        builder: (context, snapshot) {
          final hasInternet = snapshot.data ?? false;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomProgressIndicator();
          } else if (!hasInternet) {
            return const NoInternetWidget();
          } else {
            return const HomeTabViewBody();
          }
        },
      ),
    );
  }
}
