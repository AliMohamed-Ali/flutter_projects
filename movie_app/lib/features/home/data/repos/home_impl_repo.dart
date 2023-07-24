import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/model/movie_model.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failure, List<MovieModel>>> fetchCommingSoonMovie() {
    // TODO: implement fetchCommingSoonMovie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchMostPopularMovie() {
    // TODO: implement fetchMostPopularMovie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovie() {
    // TODO: implement fetchTopRatedMovie
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopTenInHollywoodMovie() {
    // TODO: implement fetchTopTenInHollywoodMovie
    throw UnimplementedError();
  }

}