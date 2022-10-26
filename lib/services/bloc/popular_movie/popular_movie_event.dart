part of 'popular_movie_bloc.dart';

abstract class PopularMovieEvent extends Equatable {
  const PopularMovieEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovieWithType extends PopularMovieEvent{
  final String page;

  const GetPopularMovieWithType(this.page);

  @override
  List<Object> get props => [page];
}
