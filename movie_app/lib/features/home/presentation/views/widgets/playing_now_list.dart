import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/core/utils/widget/custom_failure_message.dart';
import 'package:movie_app/core/utils/widget/custom_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/intheaterMovie/in_theater_movie_cubit.dart';
import 'package:movie_app/core/utils/widget/custom_movie_image.dart';
import 'package:movie_app/features/home/presentation/manager/topRatingMovie/top_rating_cubit.dart';

class PlayingNowListView extends StatelessWidget {
  const PlayingNowListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: BlocBuilder<InTheaterMovieCubit, InTheaterMovieState>(
        builder: (context, state) {
          if (state is InTheaterMovieLoading) {
            return const CustomProgressIndicator();
          } else if (state is InTheaterMovieSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length + 1,
              itemBuilder: (context, index) {
                if (index < state.movies.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: CustomMovieImage(
                          imageUrl:
                              "${ApiService.baseImageW200}${state.movies[index].posterPath}"),
                    ),
                  );
                } else {
                  BlocProvider.of<InTheaterMovieCubit>(context)
                      .fetchInTheaterMovie();
                  return const CustomProgressIndicator();
                }
              },
            );
          } else if (state is InTheaterMovieFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
