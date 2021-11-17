import 'package:flutter/material.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/shared/blocs/game_bloc.dart';

Widget removeButton(Game _game, GameBloc _bloc) {
  return RawMaterialButton(
    padding: const EdgeInsets.all(10.0),
    elevation: 12.0,
    onPressed: () => _bloc.removeCurrentGame(_game),
    shape: const CircleBorder(),
    fillColor: Colors.white,
    child: Tooltip(
      message: 'Remove from playlist',
      child: const Icon(
        Icons.close,
        size: 40.0,
        color: Colors.redAccent,
      ),
    ),
  );
}
