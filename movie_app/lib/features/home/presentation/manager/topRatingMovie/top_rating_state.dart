part of 'top_rating_cubit.dart';

abstract class TopRatingState extends Equatable {
  const TopRatingState();

  @override
  List<Object> get props => [];
}

class TopRatingInitial extends TopRatingState {}
class TopRatingLoading extends TopRatingState {}
class TopRatingSuccess extends TopRatingState {
  final List<MovieModel> movies;

  const TopRatingSuccess(this.movies);
}
class TopRatingFailure extends TopRatingState {
  final String errMessage;

 const  TopRatingFailure(this.errMessage);
}
