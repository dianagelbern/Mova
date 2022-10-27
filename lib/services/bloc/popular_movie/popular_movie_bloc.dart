import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mova/models/moviesResponse.dart';
import 'package:mova/services/bloc/movie_item/movie_item_bloc.dart';
import 'package:mova/services/repositories/movie_repository.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final MovieRepository movieRepository;

  PopularMovieBloc(this.movieRepository) : super(PopularMovieInitial()) {
    on<GetPopularMovieWithType>(_getMovies);
    
  }

  void _getMovies(
      GetPopularMovieWithType event, Emitter<PopularMovieState> emit) async {
        try{
          final popularmovies = await movieRepository.getPopularMovies(event.page);
          emit(GetPopularMovie(popularmovies, event.page));
          return;
        } on Exception catch (e) {
          emit(PopularMovieError(e.toString()));
        }
      }
}
