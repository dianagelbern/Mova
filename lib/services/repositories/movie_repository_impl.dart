import 'dart:convert';

import 'package:mova/models/credits.dart';
import 'package:mova/models/movie.dart';
import 'package:mova/models/moviesResponse.dart';
import 'package:mova/models/videoResponse.dart';
import 'package:mova/services/repositories/movie_repository.dart';
import 'package:mova/services/routes.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl extends MovieRepository{
  Future<Movie> getDetails(String idMovie) async {
    String uri = Routes.getDetails(idMovie);

    final response = await http.get(Uri.parse(uri));
    if(response.statusCode == 200){
      return Movie.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Fail to load');
    }
  }
  
  @override
  Future <List<Cast>> getCast(String idMovie) async {
    String uri = Routes.getCastOfMovie(idMovie);
    final response = await http.get(Uri.parse(uri));
    if(response.statusCode == 200){
      
      return Credits.fromJson(jsonDecode(response.body)).cast;
      
    }else{
      throw Exception('Fail to load');
    }
  }

  @override
  Future<List<MovieItem>> getPopularMovies(String page) async {
    String uri = Routes.getPopularMovies();

    final response = await http.get(Uri.parse(uri));

    if(response.statusCode == 200){
      return MoviesResponse.fromJson(jsonDecode(response.body)).results;
    }else{
      throw Exception('Fail to load');
    }
  }
  
  @override
  Future<List<MovieItem>> getNowPlayingMovie(String page) async {
    String uri = Routes.getNowPlayingMovies();

    final response = await http.get(Uri.parse(uri));

    if(response.statusCode == 200){
      return MoviesResponse.fromJson(jsonDecode(response.body)).results;
    }else{
      throw Exception('Fail to load');
    }
  }

  @override
  Future<List<VideoItem>> getTrailers(String movieId) async {
    String uri = Routes.getTrailers(movieId);

    final response = await http.get(Uri.parse(uri));

    if(response.statusCode == 200){
      return VideoResponse.fromJson(jsonDecode(response.body)).videoItem;
    }else{
      throw Exception('Fail to load');
    }
  }

  
}