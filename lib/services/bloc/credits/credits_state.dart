part of 'credits_bloc.dart';

abstract class CreditsState extends Equatable {
  const CreditsState();
  
  @override
  List<Object> get props => [];
}

class CreditsInitial extends CreditsState {}

class CreditsItemFetchedState extends CreditsState{
  final List<Cast> castList;

  const CreditsItemFetchedState(this.castList);

  @override
  List<Object> get props => [];
}

class CreditsItemFetchedError extends CreditsState{
  final String message;

  const CreditsItemFetchedError(this.message);

  @override
  List<Object> get props => [];
}