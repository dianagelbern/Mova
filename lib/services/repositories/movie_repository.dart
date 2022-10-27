import 'dart:convert';

import 'package:mova/models/credits.dart';
import 'package:mova/models/movie.dart';
import 'package:mova/models/moviesResponse.dart';
import 'package:mova/models/videoResponse.dart';
import 'package:mova/services/routes.dart';
import 'package:http/http.dart' as http;

abstract class MovieRepository {
  Future<Movie> getDetails(String idMovie);

  Future <List<Cast>> getCast(String idMovie);

  Future <List<MovieItem>> getPopularMovies(String page);

  Future <List<MovieItem>> getNowPlayingMovie(String page);

  Future <List<VideoItem>> getTrailers(String movieId);
}
