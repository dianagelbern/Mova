part of 'credits_bloc.dart';

abstract class CreditsEvent extends Equatable {
  const CreditsEvent();

  @override
  List<Object> get props => [];
}

class CreditsItemFetchEvent extends CreditsEvent{
  final String id;

  const CreditsItemFetchEvent(this.id);

  @override
  List<Object> get props => [];
}
