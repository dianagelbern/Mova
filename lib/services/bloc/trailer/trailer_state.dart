part of 'trailer_bloc.dart';

abstract class TrailerState extends Equatable {
  const TrailerState();
  
  @override
  List<Object> get props => [];
}

class TrailerInitial extends TrailerState {}

class TrailerFetchedState extends TrailerState{
  final List<VideoItem> trailers;

  const TrailerFetchedState(this.trailers);

  @override
  List<Object> get props => [];
}

class TrailerFetchedError extends TrailerState {
  final String message;

  const TrailerFetchedError(this.message);

  @override
  List<Object> get props => [];
}