
import 'package:mova/utils/constants.dart';

class Routes {


static const String apiUrlBase = "https://api.themoviedb.org/3";

//$idMovie
static String getDetails(String idMovie) => "$apiUrlBase/movie/$idMovie?api_key=${Constants.apiKey}";

static String getPopularMovies() => "$apiUrlBase/movie/popular?api_key=${Constants.apiKey}&language=en-US&page=1";

static String getNowPlayingMovies () => "$apiUrlBase/movie/now_playing?api_key=${Constants.apiKey}&language=en-US&page=1";

static String getCastOfMovie(String idMovie)  => "$apiUrlBase/movie/$idMovie/credits?api_key=${Constants.apiKey}&language=en-US&page=1";

static String getTrailers(idMovie) => "$apiUrlBase/movie/$idMovie/videos?api_key=${Constants.apiKey}&language=en-US";
}