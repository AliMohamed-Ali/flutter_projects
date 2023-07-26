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
  Future<Either<Failure, List<MovieModel>>> fetchCommingSoonMovie(
      int? page) async {
    try {
      var data = await apiService.get(endpoint: "movie/upcoming", page: page);
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
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMovie() async {
    try {
      var data = await apiService.get(endpoint: "trending/movie/day");
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
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovie(
      int? page) async {
    try {
      var data = await apiService.get(endpoint: "movie/top_rated?page=$page");
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
  Future<Either<Failure, List<MovieModel>>> fetchInTheaterMovie(
      int? page) async {
    try {
      var data =
          await apiService.get(endpoint: "movie/now_playing", page: page);
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
  Future<Either<Failure, List<MovieModel>>> fetchTopTenInHollywoodMovie(
      int? page) {
    // TODO: implement fetchTopTenInHollywoodMovie
    throw UnimplementedError();
  }
}
