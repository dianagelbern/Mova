part of 'trailer_bloc.dart';

abstract class TrailerEvent extends Equatable {
  const TrailerEvent();

  @override
  List<Object> get props => [];
}


class TrailerFetchEvent extends TrailerEvent{
  final String idMovie;

  const TrailerFetchEvent(this.idMovie);

  @override
  List<Object> get props => [];
}