import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mova/models/MoviesResponse.dart';
import 'package:mova/services/repositories/movie_repository.dart';

part 'now_playing_movie_event.dart';
part 'now_playing_movie_state.dart';

class NowPlayingMovieBloc extends Bloc<NowPlayingMovieEvent, NowPlayingMovieState> {
  final MovieRepository movieRepository;

  
  NowPlayingMovieBloc(this.movieRepository) : super(NowPlayingMovieInitial()) {
    on<GetNowPlayingWithType>(_getNowPlaying);
  }

  void _getNowPlaying (
    GetNowPlayingWithType event, Emitter<NowPlayingMovieState> emit) async {
      try {
        final nowPlatingMovies = await movieRepository.getNowPlayingMovie(event.page);
        emit(GetNowPlayingMovie(nowPlatingMovies, event.page));
        return;
      } on Exception catch (e) {
        emit(NowPlayingMovieError(e.toString()));
      }
    }
}
