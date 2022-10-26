part of 'popular_movie_bloc.dart';

abstract class PopularMovieState extends Equatable {
  const PopularMovieState();
  
  @override
  List<Object> get props => [];
}

class PopularMovieInitial extends PopularMovieState {}

class GetPopularMovie extends PopularMovieState {
  final List<MovieItem> popularmovies;
  final String page;

  const GetPopularMovie(this.popularmovies, this.page);

   @override
  List<Object> get props => [popularmovies];
}

class PopularMovieError extends PopularMovieState {
  final String message;
  const PopularMovieError(this.message);

  @override
  List<Object> get props => [message];
}
