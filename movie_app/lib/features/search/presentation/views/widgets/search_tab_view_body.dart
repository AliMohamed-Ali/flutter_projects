import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/core/utils/widget/custom_failure_message.dart';
import 'package:movie_app/core/utils/widget/custom_progress_indicator.dart';
import 'package:movie_app/features/search/presentation/manager/cubit/search_movie_cubit.dart';

import '../../../../../core/utils/widget/custom_movie_image.dart';

class SearchTabViewBody extends StatelessWidget {
  const SearchTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Search Movies'),
              onChanged: (query) {
                BlocProvider.of<SearchMovieCubit>(context).searchMovie(query);
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieLoaded) {
                  return const CustomProgressIndicator();
                } else if (state is SearchMovieSuccess) {
                  if (state.movies.isEmpty) {
                    return const CustomFailureWidget(
                        errMessage: "No movies found for the given query.");
                  }
                  return ListView.builder(
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return ListTile(
                        title: Text(movie.title ?? ""),
                        subtitle: Text(
                          "${movie.overview}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: movie.posterPath != null &&
                                movie.posterPath!.isNotEmpty
                            ? CustomMovieImage(
                                imageUrl:
                                    "${ApiService.baseImageW92}${movie.posterPath}",
                              )
                            : const Icon(Icons.movie),
                        onTap: () {
                          // Handle movie tap to navigate to web details view
                          // You can use Navigator.pushNamed to navigate to the web details view
                          // and pass the selected movie data as arguments
                        },
                      );
                    },
                  );
                } else if (state is SearchMovieFailure) {
                  return const CustomFailureWidget(
                      errMessage: "Error while searching movies");
                } else if (state is SearchMovieIsEmpty) {
                  return const CustomFailureWidget(
                      errMessage: "No movies found for the given query.");
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      );
  
  }
}
