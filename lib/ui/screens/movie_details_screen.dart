import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mova/models/credits.dart';
import 'package:mova/models/movie.dart';
import 'package:mova/models/moviesResponse.dart';
import 'package:mova/services/bloc/credits/credits_bloc.dart';
import 'package:mova/services/bloc/trailer/trailer_bloc.dart';
import 'package:mova/services/repositories/movie_repository.dart';
import 'package:mova/services/repositories/movie_repository_impl.dart';
import 'package:mova/ui/styles.dart';
import 'package:mova/ui/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

import '../../services/bloc/movie_item/movie_item_bloc.dart';

class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  String id;
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieRepository movie_repository;

  @override
  void initState() {
    super.initState();
    movie_repository = MovieRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return MovieItemBloc(movie_repository)
                ..add(MovieItemFetchEvent(widget.id));
            },
          ),
          BlocProvider(
            create: (context) {
              return CreditsBloc(movie_repository)
                ..add(CreditsItemFetchEvent(widget.id));
            },
          ),
          
          BlocProvider(create: (context) {
            return TrailerBloc(movie_repository)
              ..add(TrailerFetchEvent(widget.id));
          })
          
        ],
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                _createMovieView(context),
                _createCastView(context),
                //_trailer()
                _movieTrailer(context)
              ],
            ),
          ),
        ));
  }

  Widget _createCastView(BuildContext context) {
    return BlocBuilder<CreditsBloc, CreditsState>(builder: (context, state) {
      if (state is CreditsInitial) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state is CreditsItemFetchedError) {
        return Text('Fail to load');
      } else if (state is CreditsItemFetchedState) {
        return listCast(context, state.castList);
      } else {
        return Text(
          'Not support',
          style: Styles.textSubtitle,
        );
      }
    });
  }

  Widget _createMovieView(BuildContext context) {
    return BlocBuilder<MovieItemBloc, MovieItemState>(
        builder: (context, state) {
      if (state is MovieItemInitial) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state is MovieItemFetchError) {
        return Text('Fail to load');
      } else if (state is MovieItemfetchedState) {
        return Column(
          children: [header(context, state.movie), body(context, state.movie)],
        );
      } else {
        return Text(
          'Not support',
          style: Styles.textSubtitle,
        );
      }
    });
  }

  Widget _trailer() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Trailer', style: Styles.texttitleRed),),
          Container(
            height: 230,
            child: VideoPlayerItem(
              VideoPlayerItemController: VideoPlayerController.network(
                'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
              ),
              looping: false,
            ),
          )
        ],
      ),
    );
  }

  
  Widget _movieTrailer(BuildContext context) {
    return BlocBuilder<TrailerBloc, TrailerState>(builder: (context, state) {
      if (state is TrailerInitial) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state is TrailerFetchedError) {
        return Text('Fail to load');
      } else if (state is TrailerFetchedState) {
        return _trailer();
      } else {
        return Text('Not support', style: Styles.textSubtitle,);
      }
    });
  }
  

  Widget header(BuildContext context, Movie movie) {
    return Stack(
      children: [
        Container(
          height: 380,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            'https://image.tmdb.org/t/p/original${movie.posterPath!}',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 40),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Widget body(BuildContext context, Movie movie) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title!,
            style: Styles.textTitle,
          ),
          Row(
            children: [
              Container(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.star_half,
                      color: Color(0xFFE21221),
                      size: 20,
                    ),
                    Text(
                      movie.voteAverage.toString().substring(0, 3),
                      style: Styles.textSubtitleRed,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(0xFFE21221),
                      size: 25,
                    ),
                    Text(
                      movie.releaseDate.toString(),
                      style: Styles.textSubtitle,
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  height: 30,
                  child: Container(
                      margin: EdgeInsets.all(5),
                      child: Text(
                        movie.genres.elementAt(0).name,
                        style: Styles.textSubtitleRed,
                      )),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE21221), width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ))
            ],
          ),
          Text(
            movie.overview!,
            style: Styles.textSubtitle,
          ),
        ],
      ),
    );
  }

  Widget listCast(BuildContext context, List<Cast> cast) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return castItem(context, cast[index]);
          },
          scrollDirection: Axis.horizontal,
          itemCount: cast.length,
        ),
      ),
    );
  }

  Widget castItem(BuildContext context, Cast cast) {
    debugPrint(cast.profilePath);
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => Icon(Icons.error),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                imageUrl:
                    'https://image.tmdb.org/t/p/original${cast.profilePath!}',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    cast.name!,
                    style: Styles.textSubtitleBold,
                  ),
                  Text(
                    cast.character!,
                    style: Styles.textSubtitleGray,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
