import 'package:blocpatt/app/bloc/jokeBloc/joke_event.dart';
import 'package:blocpatt/app/bloc/jokeBloc/joke_state.dart';
import 'package:blocpatt/app/data/dataProvider/app_exception.dart';
import 'package:blocpatt/app/data/repository/joke/joke_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeInitial()) {
    final JokeRepository apiRepository = JokeRepository();

    on<GetJoke>((event, emit) async {
      try {
        emit(JokeLoading());
        final mList = await apiRepository.getJoke();
        emit(JokeLoaded(mList));
      } on FetchDataException {
        emit(const JokeError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
