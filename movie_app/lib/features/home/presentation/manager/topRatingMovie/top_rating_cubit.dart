import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

import '../../../data/repos/home_repo.dart';

part 'top_rating_state.dart';

class TopRatingCubit extends Cubit<TopRatingState> {
  TopRatingCubit(this.homeRepo) : super(TopRatingInitial());
  final HomeRepo homeRepo;
  int page =1;
  ScrollController scrollController =  ScrollController();

  Future<void> fetchTopRatedMovie() async {
    emit(TopRatingLoading());
    var result = await homeRepo.fetchTopRatedMovie(page);
    result.fold((failure) => emit(TopRatingFailure(failure.errMessage)),
        (movies) => emit(TopRatingSuccess(movies)));
  }
}
