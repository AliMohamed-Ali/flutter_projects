import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/views/widgets/home_tab_view_body.dart';

import '../../../../core/utils/check_conductivity.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/utils/widget/custom_progress_indicator.dart';
import '../../../../core/utils/widget/no_internet.dart';
import '../../data/repos/home_impl_repo.dart';
import '../manager/intheaterMovie/in_theater_movie_cubit.dart';
import '../manager/topRatingMovie/top_rating_cubit.dart';
import '../manager/trendingMovie/trending_movies_cubit.dart';
import '../manager/upcommingMovie/upcomming_cubit.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

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
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => UpcommingCubit(
                    getIt.get<HomeRepoImpl>(),
                  )..fetchUpcommingMovie(),
                ),
                BlocProvider(
                  create: (context) => TrendingMoviesCubit(
                    getIt.get<HomeRepoImpl>(),
                  )..fetchTrendingMovie(),
                ),
                BlocProvider(
                  create: (context) => TopRatingCubit(
                    getIt.get<HomeRepoImpl>(),
                  )..fetchTopRatedMovie(),
                ),
                BlocProvider(
                  create: (context) => InTheaterMovieCubit(
                    getIt.get<HomeRepoImpl>(),
                  )..fetchInTheaterMovie(),
                ),
              ],
              child:const HomeTabViewBody(),
            );
          }
        },
      ),
    );
  }
}
