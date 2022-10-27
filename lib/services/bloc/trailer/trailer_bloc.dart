import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mova/models/videoResponse.dart';
import 'package:mova/services/repositories/movie_repository.dart';

part 'trailer_event.dart';
part 'trailer_state.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  final MovieRepository movieRepository;

  TrailerBloc(this.movieRepository) : super(TrailerInitial()) {
    on<TrailerFetchEvent>(_getTrailer);
  }

  FutureOr<void> _getTrailer (TrailerFetchEvent event, Emitter<TrailerState> emit) async {
    try {
      final trailer = await movieRepository.getTrailers(event.idMovie);
      emit(TrailerFetchedState(trailer));
      return ;
    } on Exception catch (e) {
      emit(TrailerFetchedError(e.toString()));
    }
  }
}
