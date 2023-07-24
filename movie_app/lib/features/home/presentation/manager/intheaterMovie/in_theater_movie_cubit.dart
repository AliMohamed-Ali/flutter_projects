import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/model/movie_model.dart';

import '../../../data/repos/home_repo.dart';

part 'in_theater_movie_state.dart';

class InTheaterMovieCubit extends Cubit<InTheaterMovieState> {
  InTheaterMovieCubit(this.homeRepo) : super(InTheaterMovieInitial());
  final HomeRepo homeRepo;

  Future<void> fetchInTheaterMovie() async {
    emit(InTheaterMovieLoading());
    var result = await homeRepo.fetchInTheaterMovie();
    result.fold((failure) => emit(InTheaterMovieFailure(failure.errMessage)),
        (movies) => emit(InTheaterMovieSuccess(movies)));
  }
}
