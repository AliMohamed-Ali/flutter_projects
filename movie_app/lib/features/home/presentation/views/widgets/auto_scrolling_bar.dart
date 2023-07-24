import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/core/utils/api_service.dart';

import '../../../../../model/movie_model.dart';

class MovieCarousel extends StatelessWidget {
  final List<MovieModel> movies;

  MovieCarousel({required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
        return MovieCarouselItem(movie: movies[index]);
      },
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        height: 200,
      ),
    );
  }
}

class MovieCarouselItem extends StatelessWidget {
  final MovieModel movie;

  MovieCarouselItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Poster image
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AspectRatio(
            aspectRatio: 1.6,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "${ApiService.baseImage}${movie.posterPath}",
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        // Overlay with movie details
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.black54,
            child: Text(
              movie.title ?? "",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
