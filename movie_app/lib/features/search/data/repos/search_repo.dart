
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../model/movie_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query);
}
