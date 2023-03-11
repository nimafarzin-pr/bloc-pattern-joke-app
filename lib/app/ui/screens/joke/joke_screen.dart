import 'package:blocpatt/app/bloc/jokeBloc/joke_bloc.dart';
import 'package:blocpatt/app/bloc/jokeBloc/joke_event.dart';
import 'package:blocpatt/app/bloc/jokeBloc/joke_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc pattern'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextButton(
              onPressed: () {
                context.read<JokeBloc>().add(GetJoke());
              },
              child: const Text('get data')),
          BlocBuilder<JokeBloc, JokeState>(
            builder: (context, state) {
              if (state is JokeInitial) {
                context.read<JokeBloc>().add(GetJoke());
              }
              if (state is JokeError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(state.message!),
                  ],
                );
              }
              if (state is JokeLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '${state.jokeModel.type} \n',
                        style: const TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${state.jokeModel.setup} \n',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '${state.jokeModel.punchline} \n'),
                        ],
                      ),
                    )
                  ],
                );
              }

              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
