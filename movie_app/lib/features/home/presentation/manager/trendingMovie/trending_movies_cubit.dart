import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../model/movie_model.dart';
import '../../../data/repos/home_repo.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit(this.homeRepo) : super(TrendingMoviesInitial());
  final HomeRepo homeRepo;

  Future<void> fetchTrendingMovie() async {
    if (state is TrendingMoviesLoading) return;
    emit(TrendingMoviesLoading());
    var result = await homeRepo.fetchTrendingMovie();
    result.fold((failure) => emit(TrendingMoviesFailure(failure.errMessage)),
        (movies) => emit(TrendingMoviesSuccess(movies)));
  }
}
