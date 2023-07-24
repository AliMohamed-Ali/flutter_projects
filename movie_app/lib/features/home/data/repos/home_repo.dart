import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/model/movie_model.dart';

abstract class HomeRepo {
 Future<Either<Failure,List<MovieModel>>> fetchMostPopularMovie();
 Future<Either<Failure,List<MovieModel>>>  fetchCommingSoonMovie();
 Future<Either<Failure,List<MovieModel>>>  fetchTopRatedMovie();
 Future<Either<Failure,List<MovieModel>>>  fetchTopTenInHollywoodMovie();
}