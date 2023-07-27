import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/core/utils/widget/custom_failure_message.dart';
import 'package:movie_app/core/utils/widget/custom_progress_indicator.dart';
import 'package:movie_app/features/details/presentation/views/movie_details_page.dart';
import 'package:movie_app/features/home/presentation/manager/trendingMovie/trending_movies_cubit.dart';

import '../../../../../model/movie_model.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
      builder: (context, state) {
        if (state is TrendingMoviesSuccess) {
          return CarouselSlider.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index, realIndex) {
              return MovieCarouselItem(movie: state.movies[index]);
            },
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              height: 200,
            ),
          );
        } else if (state is TrendingMoviesFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}

class MovieCarouselItem extends StatelessWidget {
  final MovieModel movie;

  const MovieCarouselItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsPage.id, arguments: movie);
      },
      child: Stack(
        children: [
          // Poster image with placeholder while loading
          CachedNetworkImage(
            imageUrl: "${ApiService.baseImageW200}${movie.posterPath}",
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 1.6,
                child: Image(
                  fit: BoxFit.fill,
                  image: imageProvider,
                ),
              ),
            ),
            placeholder: (context, url) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 1.6,
                child: Container(
                  color: Colors.grey[300], // Placeholder color while loading
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          // Gradient overlay with movie details
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
