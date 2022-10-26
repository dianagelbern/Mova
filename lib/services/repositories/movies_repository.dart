import 'dart:convert';

import 'package:mova/models/Movie.dart';
import 'package:mova/services/routes.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  Future<Movie> getDetails(String idMovie) async {
    String uri = Routes.getDetails(idMovie);

    final response = await http.get(Uri.parse(uri));
    if(response.statusCode == 200){
      return Movie.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Fail to load');
    }
  }

  
}
