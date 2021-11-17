import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:design_system/design_system.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/routes/arguments/game_details_arg.dart';
import 'package:igames/core/shared/blocs/game_bloc.dart';
import 'package:igames/core/shared/functions/checkImageUrl.dart';
import 'package:igames/features/game/widgets/add_button.dart';
import 'package:igames/features/game/widgets/circular_clipper.dart';
import 'package:igames/features/game/widgets/remove_button.dart';

final getIt = GetIt.instance;

class GamePage extends StatefulWidget {
  final GameDetailsArg args;

  const GamePage({required this.args});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Game _game;

  final GameBloc _bloc = getIt<GameBloc>();

  @override
  void initState() {
    _game = widget.args.game;
    _bloc.verifyPlaylistButtonState(_game);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: _game,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: const Shadow(blurRadius: 15.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        checkImageUrl(_game),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 25.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _bloc.playlistButton.toBuild(
                    onSuccess: (bool data) {
                      if (data) return removeButton(_game, _bloc);
                      return addButton(_game, _bloc);
                    },
                    onLoading: Spacer(),
                    onError: Spacer(),
                    data: false,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                _game.name,
                style: titleStyle,
              ),
              Text(
                '${_game.rating.toString()} / 5',
                style: subTitleStyle,
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Release date',
                            style: subTitleStyle,
                          ),
                          Text(
                            _game.released != null
                                ? _game.released.toString()
                                : 'no date yet',
                            style: text,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Playtime',
                            style: subTitleStyle,
                          ),
                          Text(
                            _game.playtime != null
                                ? '${_game.playtime.toString()}h'
                                : 'no playtime registered yet',
                            style: text,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Metacritic rating',
                              style: subTitleStyle,
                            ),
                            Text(
                              _game.metacritic != null
                                  ? '${_game.metacritic.toString()} / 100'
                                  : 'no rating',
                              style: text,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Genres',
                style: subTitleStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _game.genres!
                    .map(
                      (genre) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: FilterChip(
                          backgroundColor: Colors.cyan,
                          label: Text(
                            genre.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          onSelected: (b) {},
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
