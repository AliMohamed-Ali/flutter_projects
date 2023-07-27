import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failure.dart';
import 'package:movie_app/core/utils/api_service.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';
import 'package:movie_app/model/movie_model.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query) async {
    try {
      var data = await apiService.get(endpoint: "search/movie?query=$query");
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
}
