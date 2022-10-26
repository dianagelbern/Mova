import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mova/models/Credits.dart';
import 'package:mova/services/repositories/movie_repository.dart';

part 'credits_event.dart';
part 'credits_state.dart';

class CreditsBloc extends Bloc<CreditsEvent, CreditsState> {
  final MovieRepository movieRepository;

  CreditsBloc(this.movieRepository) : super(CreditsInitial()) {
    on<CreditsItemFetchEvent>(_credits);
  }

  FutureOr<void> _credits(CreditsItemFetchEvent event,
      Emitter<CreditsState> emit) async {
    try {
      final creditItem = await movieRepository.getCast(event.id);
      emit(CreditsItemFetchedState(creditItem));
      return;
    } on Exception catch (e) {
      emit(CreditsItemFetchedError(e.toString()));
    }
  }
}
