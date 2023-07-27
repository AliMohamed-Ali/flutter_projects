import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/widget/custom_movie_image.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/core/utils/api_service.dart';

class MovieDetailsPage extends StatelessWidget {
  static String id = "MovieDetailsPage";

  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)?.settings.arguments as MovieModel;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Movie poster
            Container(
                height: 300,
                margin:
                    EdgeInsets.symmetric(horizontal: width * .25, vertical: 20),
                child: CustomMovieImage(
                  imageUrl: "${ApiService.baseImageW200}${movie.posterPath}",
                )),
            // Movie title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                movie.title ?? "",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Movie release date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Release Date: ${movie.releaseDate ?? ""}",
                style: TextStyle(fontSize: 18),
              ),
            ),
            // Movie genres
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Genres: ${movie.genreIds?.join(", ") ?? ""}",
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Movie rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Rating: ${movie.voteAverage ?? 0.0}",
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Movie overview
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                movie.overview ?? "",
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Add more movie details here as needed
          ],
        ),
      ),
    );
  }
}
