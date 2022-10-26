import 'dart:convert';

import 'package:mova/models/Movie.dart';
import 'package:mova/services/routes.dart';
import 'package:http/http.dart' as http;

abstract class MovieRepository {
  Future<Movie> getDetails(String idMovie);

  
}
