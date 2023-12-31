import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

import '../../../data/repos/home_repo.dart';

part 'top_rating_state.dart';

class TopRatingCubit extends Cubit<TopRatingState> {
  final HomeRepo homeRepo;
  int page = 1;
  final List<MovieModel> _movies = [];

  TopRatingCubit(this.homeRepo) : super(TopRatingInitial());

  Future<void> fetchTopRatedMovie() async {
    if (state is TopRatingLoading) return;

    emit(TopRatingLoading());

    final result = await homeRepo.fetchTopRatedMovie(page);
    page++;

    result.fold(
      (failure) => emit(TopRatingFailure(failure.errMessage)),
      (movies) {
        _movies.addAll(movies);
        emit(TopRatingSuccess(_movies));
      },
    );
  }
}
