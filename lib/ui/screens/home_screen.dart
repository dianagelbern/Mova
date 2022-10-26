import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/models/PopularMovie.dart';
import 'package:mova/services/bloc/popular_movie/popular_movie_bloc.dart';
import 'package:mova/services/repositories/movie_repository.dart';
import 'package:mova/services/repositories/movie_repository_impl.dart';
import 'package:mova/ui/screens/movie_details_screen.dart';
import 'package:mova/ui/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieRepository movieRepository;

  String get page => '1';

  @override
  void initState() {
    super.initState();
    movieRepository = MovieRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PopularMovieBloc(movieRepository)
          ..add(GetPopularMovieWithType(page));
      },
      child: _createMovies(context),
    );
  }

  Widget _createMovies(BuildContext context) {
    return BlocBuilder<PopularMovieBloc, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PopularMovieError) {
          return Text('Fail to load');
        } else if (state is GetPopularMovie) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [header(), listMovieItem(context, state.popularmovies)],
            )),
          ));
        } else {
          return const Text('Not support');
        }
      },
    );
  }

  Widget header() {
    return SizedBox(
      height: 400,
      //Stack for the background image
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/poster_template.jpg',
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          width: 800,
          color: Color.fromARGB(137, 28, 26, 41),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 50,
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Strange 2',
                  style: Styles.textTitle,
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Action, Super Hero ',
                    style: Styles.textRegular,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget listMovieItem(BuildContext context, List<MovieItem> movies) {
    final contentHeight = 5.0 * (MediaQuery.of(context).size.width / 2.4) / 3;
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Movies',
                  style: Styles.textTitle,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    'See all',
                    style: Styles.textSubtitleRed,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: contentHeight,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _createPopularViewItem(context, movies[index]);
              },
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createPopularViewItem(BuildContext context, MovieItem movie) {
    final width = MediaQuery.of(context).size.width / 2.6;
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(
                      id: movie.id.toString(),
                    )),
          );
        },
        child: Container(
            margin: EdgeInsets.only(right: 10),
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl: 'https://image.tmdb.org/t/p/original' +
                        movie.posterPath!,
                    fit: BoxFit.cover,
                    
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    width: 30,
                    height: 20,
                    color: Colors.red,
                    child: Text(movie.voteAverage.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  )
                ],
              ),
            )));
  }
}
