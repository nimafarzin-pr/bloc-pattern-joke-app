import 'package:blocpatt/app/data/models/joke/joke_model.dart';
import 'package:equatable/equatable.dart';

abstract class JokeState extends Equatable {
  const JokeState();

  @override
  List<Object?> get props => [];
}

class JokeInitial extends JokeState {}

class JokeLoading extends JokeState {}

class JokeLoaded extends JokeState {
  final JokeModel jokeModel;
  const JokeLoaded(this.jokeModel);
}

class JokeError extends JokeState {
  final String? message;
  const JokeError(this.message);
}
