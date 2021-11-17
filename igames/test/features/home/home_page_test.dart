import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/data/igames_stream.dart';
import 'package:igames/core/shared/blocs/game_bloc.dart';
import 'package:igames/features/home/home_page.dart';
import 'package:mocktailx/mocktailx.dart';
import './resources/game.dart';

final getIt = GetIt.instance;

class MockGameBloc extends Mock implements GameBloc {}

void main() {
  late MockGameBloc _gameBloc;

  setUpAll(() {
    _gameBloc = MockGameBloc();
    GetIt.instance.registerSingleton<GameBloc>(_gameBloc);
    when(() => _gameBloc.getGames()).thenAnswer(
      (_) => [
        Game.fromJson(
          jsonDecode(
            game(),
          ),
        ),
      ],
    );
  });

  void configGames() {
    final stream = IGamesStream<List<Game>>();
    stream.add(
      [
        Game.fromJson(
          jsonDecode(
            game(),
          ),
        ),
      ],
    );
    when(() => _gameBloc.games).thenAnswer(
      (invocation) => stream,
    );
  }

  void configTopRatedGames() {
    final stream = IGamesStream<List<Game>>();
    stream.add(
      [
        Game.fromJson(
          jsonDecode(
            game(),
          ),
        ),
      ],
    );
    when(() => _gameBloc.topRatedGames).thenAnswer(
      (invocation) => stream,
    );
  }

  testWidgets('Should open', (WidgetTester tester) async {
    configGames();
    configTopRatedGames();
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );
  });
}
