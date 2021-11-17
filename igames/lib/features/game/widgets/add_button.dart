import 'package:flutter/material.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/shared/blocs/game_bloc.dart';

Widget addButton(Game _game, GameBloc _bloc) {
  return RawMaterialButton(
    padding: const EdgeInsets.all(10.0),
    elevation: 12.0,
    onPressed: () => _bloc.saveCurrentGame(_game),
    shape: const CircleBorder(),
    fillColor: Colors.white,
    child: Tooltip(
      message: 'Add to playlist',
      child: const Icon(
        Icons.add,
        size: 40.0,
        color: Colors.cyan,
      ),
    ),
  );
}
