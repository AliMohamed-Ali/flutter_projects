import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/widget/custom_movie_image.dart';
import '../../../../details/presentation/views/movie_details_page.dart';

class SearchMovieView extends StatelessWidget {
  const SearchMovieView({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
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
                        Navigator.pushNamed(context, MovieDetailsPage.id,
                            arguments: movie);
                      },
                    );
  }
}