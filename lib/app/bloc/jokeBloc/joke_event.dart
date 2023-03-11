import 'package:equatable/equatable.dart';

abstract class JokeEvent extends Equatable {
  const JokeEvent();

  @override
  List<Object> get props => [];
}

class GetJoke extends JokeEvent {}

class JokeInitialE extends JokeEvent {}
