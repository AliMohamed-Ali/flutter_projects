import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie_model.dart';

import '../../../data/repos/home_repo.dart';

part 'in_theater_movie_state.dart';

class InTheaterMovieCubit extends Cubit<InTheaterMovieState> {
  final HomeRepo homeRepo;
  int page = 1;
  final List<MovieModel> _movies = [];

  InTheaterMovieCubit(this.homeRepo) : super(InTheaterMovieInitial());

  Future<void> fetchInTheaterMovie() async {
    if (state is InTheaterMovieLoading) return;

    emit(InTheaterMovieLoading());

    final result = await homeRepo.fetchInTheaterMovie(page);
    page++;

    result.fold(
      (failure) => emit(InTheaterMovieFailure(failure.errMessage)),
      (movies) {
        _movies.addAll(movies);
        emit(InTheaterMovieSuccess(_movies));
      },
    );
  }
}
