part of 'now_playing_movie_bloc.dart';

abstract class NowPlayingMovieEvent extends Equatable {
  const NowPlayingMovieEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingWithType extends NowPlayingMovieEvent{
  final String page;

  const GetNowPlayingWithType(this.page);

  @override
  List<Object> get props => [page];
}
