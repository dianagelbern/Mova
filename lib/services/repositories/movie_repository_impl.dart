import 'dart:convert';

import 'package:mova/models/Credits.dart';
import 'package:mova/models/Movie.dart';
import 'package:mova/models/PopularMovie.dart';
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
  Future <Cast> getCast(String idMovie) async {
    String uri = Routes.getCastOfMovie(idMovie);
    final response = await http.get(Uri.parse(uri));
    if(response.statusCode == 200){
      return Cast.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Fail to load');
    }
  }

  @override
  Future<List<MovieItem>> getPopularMovies(String page) async {
    String uri = Routes.getPopularMovies();

    final response = await http.get(Uri.parse(uri));

    if(response.statusCode == 200){
      return PopularMovie.fromJson(jsonDecode(response.body)).results;
    }else{
      throw Exception('Fail to load');
    }
  }

  
}