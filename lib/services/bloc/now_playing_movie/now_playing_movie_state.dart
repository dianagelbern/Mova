part of 'now_playing_movie_bloc.dart';

abstract class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();
  
  @override
  List<Object> get props => [];
}

class NowPlayingMovieInitial extends NowPlayingMovieState {}

class GetNowPlayingMovie extends NowPlayingMovieState {
  final List<MovieItem> nowMovies;
  final String page;

  const GetNowPlayingMovie(this.nowMovies, this.page);

  @override
  List<Object> get props => [nowMovies];
}

class NowPlayingMovieError extends NowPlayingMovieState {
  final String message;
  const NowPlayingMovieError(this.message);

  @override
  List<Object> get props => [message];
}
