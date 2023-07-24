part of 'upcomming_cubit.dart';

abstract class UpcommingState extends Equatable {
  const UpcommingState();

  @override
  List<Object> get props => [];
}

class UpcommingInitial extends UpcommingState {}
class UpcommingLoading extends UpcommingState {}
class UpcommingSuccess extends UpcommingState {
  final List<MovieModel> movies;

  const UpcommingSuccess(this.movies);
}
class UpcommingFailure extends UpcommingState {
  final String errMessage;

  const UpcommingFailure(this.errMessage);
}
