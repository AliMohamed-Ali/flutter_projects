part of 'in_theater_movie_cubit.dart';

abstract class InTheaterMovieState extends Equatable {
  const InTheaterMovieState();

  @override
  List<Object> get props => [];
}

class InTheaterMovieInitial extends InTheaterMovieState {}
class InTheaterMovieLoading extends InTheaterMovieState {}
class InTheaterMovieSuccess extends InTheaterMovieState {
  final List<MovieModel> movies;
 const InTheaterMovieSuccess(this.movies);

}
class InTheaterMovieFailure extends InTheaterMovieState {
  final String errMessage;

  const InTheaterMovieFailure(this.errMessage);

}
