import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/repositories/game_repository.dart';
import 'package:igames/core/services/game_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../features/home/resources/games.dart';

final getIt = GetIt.instance;

class MockGameService extends Mock implements GameService {}

void main() {
  final service = MockGameService();

  setUpAll(() async {
    GetIt.instance.registerFactory<GameService>(() => service);
  });

  final response = Response(games(), 200);

  test('GameRepository_GetGames_ShouldParseResponse', () async {
    when(() => service.getGames()).thenAnswer(
      (invocation) => Future.value(response),
    );

    final repo = HttpGameRepository();

    final result = await repo.getGames();

    expect(result is List<Game>, true);
    expect(result.length, 1);
  });
  test('GameRepository_GetTopRatedWasCalled_ShouldParseResponse', () async {
    when(() => service.getTopRatedGames()).thenAnswer(
      (invocation) => Future.value(response),
    );

    final repo = HttpGameRepository();

    final result = await repo.getTopRatedGames();

    expect(result is List<Game>, true);
    expect(result.length, 1);
  });
}
