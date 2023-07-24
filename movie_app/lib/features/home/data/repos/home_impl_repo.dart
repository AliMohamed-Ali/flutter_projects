import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/model/movie_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> fetchCommingSoonMovie() async {
    try {
      var data = await apiService.get(endpoint: "upcoming");
      List<MovieModel> movies = [];
      for (var movie in data["results"]) {
        movies.add(MovieModel.fromJson(movie));
      }
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
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