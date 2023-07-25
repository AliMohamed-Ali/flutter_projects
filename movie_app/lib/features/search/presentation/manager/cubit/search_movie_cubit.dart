import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';
import 'package:movie_app/model/movie_model.dart';

part 'search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  SearchMovieCubit(this.searchRepo) : super(SearchMovieInitial());
  final SearchRepo searchRepo;

  Future<void> searchMovie(String query) async {
    emit(SearchMovieLoaded());
    var result = await searchRepo.searchMovies(query);
    result.fold((failure) => emit(SearchMovieFailure(failure.errMessage)),
        (movies){
          if(movies.isEmpty){
            return emit(SearchMovieIsEmpty());
          }
          return emit(SearchMovieSuccess(movies));
          });
  }
}
