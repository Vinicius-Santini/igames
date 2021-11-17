import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/data/response_wrapper.dart';
import 'package:igames/core/services/game_service.dart';

final getIt = GetIt.instance;

abstract class GameRepository {
  Future<List<Game>> getGames();
  Future<List<Game>> getTopRatedGames();
}

class HttpGameRepository implements GameRepository {
  final GameService _gameService = getIt<GameService>();

  @override
  Future<List<Game>> getGames() async =>
      _parseGameList(await _gameService.getGames());

  @override
  Future<List<Game>> getTopRatedGames() async => _parseGameList(
        await _gameService.getTopRatedGames(),
      );

  List<Game> _parseGameList(Response response) {
    var body = json.decode(response.body);
    TheGameDBWrapper wrapper = TheGameDBWrapper.fromJson(body);

    return wrapper.results
        .map(
          (e) => Game.fromJson(e),
        )
        .toList();
  }
}
