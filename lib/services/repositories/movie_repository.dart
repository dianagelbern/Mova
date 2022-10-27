import 'dart:convert';

import 'package:mova/models/Credits.dart';
import 'package:mova/models/Movie.dart';
import 'package:mova/models/MoviesResponse.dart';
import 'package:mova/services/routes.dart';
import 'package:http/http.dart' as http;

abstract class MovieRepository {
  Future<Movie> getDetails(String idMovie);

  Future <List<Cast>> getCast(String idMovie);

  Future <List<MovieItem>> getPopularMovies(String page);

  Future <List<MovieItem>> getNowPlayingMovie(String page);
}
