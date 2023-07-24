import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'in_theater_movie_state.dart';

class InTheaterMovieCubit extends Cubit<InTheaterMovieState> {
  InTheaterMovieCubit() : super(InTheaterMovieInitial());
}
