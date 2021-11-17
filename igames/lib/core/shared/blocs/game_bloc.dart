import 'package:get_it/get_it.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/data/igames_stream.dart';
import 'package:igames/core/repositories/game_repository.dart';

final _getIt = GetIt.instance;

class GameBloc {
  final GameRepository _gameRepo = _getIt();

  final IGamesStream<List<Game>> games = IGamesStream<List<Game>>();
  final IGamesStream<List<Game>> topRatedGames = IGamesStream<List<Game>>();
  final IGamesStream<List<Game>> selectedGames = IGamesStream<List<Game>>();
  final IGamesStream<bool> playlistButton = IGamesStream<bool>(
    initialData: false,
  );

  void getGames() => games.handleFuture(
        _gameRepo.getGames(),
      );

  void getTopRatedGames() => topRatedGames.handleFuture(
        _gameRepo.getTopRatedGames(),
      );

  void verifyPlaylistButtonState(Game currentGame) {
    if (selectedGames.value != null &&
        selectedGames.value!.contains(currentGame)) {
      return playlistButton.add(true);
    }
    return playlistButton.add(false);
  }

  void saveCurrentGame(Game currentGame) {
    final currentList = selectedGames.value;
    if (currentList != null && currentList.isNotEmpty) {
      changePlaylistButtonState();
      return selectedGames.add([...currentList, currentGame]);
    }
    changePlaylistButtonState();
    return selectedGames.add([currentGame]);
  }

  void removeCurrentGame(Game currentGame) {
    final currentList = selectedGames.value;
    if (currentList != null && currentList.isNotEmpty) {
      final newList =
          currentList.where((item) => item.id != currentGame.id).toList();
      changePlaylistButtonState();
      selectedGames.add(newList);
    }
  }

  void changePlaylistButtonState() {
    if (playlistButton.value != null) {
      playlistButton.add(!playlistButton.value!);
    }
  }
}
