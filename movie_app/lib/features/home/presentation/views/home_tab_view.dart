import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/manager/topRatingMovie/top_rating_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/trendingMovie/trending_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/manager/upcommingMovie/upcomming_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/home_tab_view_body.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeTabViewBody(),
    );
  }
}
