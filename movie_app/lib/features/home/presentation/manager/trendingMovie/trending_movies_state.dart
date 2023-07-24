part of 'trending_movies_cubit.dart';

abstract class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();

  @override
  List<Object> get props => [];
}

class TrendingMoviesInitial extends TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<MovieModel> movies;

  const TrendingMoviesSuccess(this.movies);
}

class TrendingMoviesFailure extends TrendingMoviesState {
  final String errMessage;

  const TrendingMoviesFailure(this.errMessage);
}
