import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/repositories/game_repository.dart';
import 'package:igames/core/shared/blocs/game_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../features/home/resources/game.dart';

final getIt = GetIt.instance;

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  late GameRepository _repo;
  setUpAll(() async {
    _repo = MockGameRepository();
    GetIt.instance.registerFactory<GameRepository>(() => _repo);
  });

  test('Get games test', () async {
    when(() => _repo.getGames()).thenAnswer(
      (invocation) => Future.value([
        Game.fromJson(
          jsonDecode(
            game(),
          ),
        ),
      ]),
    );

    final bloc = GameBloc();

    verifyNever(() => bloc.getGames());

    bloc.getGames();

    verify(() => bloc.getGames()).called(1);

    bloc.games.stream.listen((event) {
      expect(event is List<Game>, true);
      expect(event.length, 1);
    });
  });

  test('Get top rated games test', () async {
    when(() => _repo.getTopRatedGames()).thenAnswer(
      (invocation) => Future.value([
        Game.fromJson(
          jsonDecode(
            game(),
          ),
        ),
      ]),
    );

    final bloc = GameBloc();

    verifyNever(() => bloc.getTopRatedGames());

    bloc.getTopRatedGames();

    verify(() => bloc.getTopRatedGames()).called(1);

    bloc.games.stream.listen((event) {
      expect(event is List<Game>, true);
      expect(event.length, 1);
    });
  });
}
