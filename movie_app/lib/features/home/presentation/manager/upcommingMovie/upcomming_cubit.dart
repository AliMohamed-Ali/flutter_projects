import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';
import 'package:movie_app/model/movie_model.dart';

part 'upcomming_state.dart';

class UpcommingCubit extends Cubit<UpcommingState> {
  UpcommingCubit(this.homeRepo) : super(UpcommingInitial());
  final HomeRepo homeRepo;
  int page = 1;
  final List<MovieModel> _movies = [];


  Future<void> fetchUpcommingMovie() async {
    emit(UpcommingLoading());
    var result = await homeRepo.fetchCommingSoonMovie(page);
    page++;
    result.fold((failure) => emit(UpcommingFailure(failure.errMessage)),
        (movies){
          _movies.addAll(movies);
          emit(UpcommingSuccess(_movies));
        });
  }
}
