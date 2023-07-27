import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/core/utils/widget/custom_failure_message.dart';
import 'package:movie_app/core/utils/widget/custom_progress_indicator.dart';
import 'package:movie_app/features/home/presentation/manager/topRatingMovie/top_rating_cubit.dart';
import 'package:movie_app/core/utils/widget/custom_movie_image.dart';

import '../../../../../model/movie_model.dart';
import '../../../../details/presentation/views/movie_details_page.dart';

class TopRatedListView extends StatelessWidget {
  const TopRatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: BlocBuilder<TopRatingCubit, TopRatingState>(
        builder: (context, state) {
          if (state is TopRatingLoading) {
            return const CustomProgressIndicator();
          } else if (state is TopRatingSuccess) {
            return ListView.builder(
              // physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.movies.length + 1,
              itemBuilder: (context, index) {
                if (index < state.movies.length) {
                  MovieModel movie = state.movies[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MovieDetailsPage.id,
                            arguments: movie);
                      },
                      child: CustomMovieImage(
                          imageUrl:
                              "${ApiService.baseImageW200}${state.movies[index].posterPath}"),
                    ),
                  );
                } else {
                  BlocProvider.of<TopRatingCubit>(context).fetchTopRatedMovie();
                  return const CustomProgressIndicator();
                }
              },
            );
          } else if (state is TopRatingFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
