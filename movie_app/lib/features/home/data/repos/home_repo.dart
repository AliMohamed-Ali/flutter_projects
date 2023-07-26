import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/model/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> fetchInTheaterMovie(int? page);
  Future<Either<Failure, List<MovieModel>>> fetchCommingSoonMovie(int? page);
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovie(int? page);
  Future<Either<Failure, List<MovieModel>>> fetchTopTenInHollywoodMovie(int? page);
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMovie();
}
