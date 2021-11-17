import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:design_system/design_system.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/shared/blocs/game_bloc.dart';
import 'package:igames/features/home/widgets/section_error.dart';
import 'package:igames/features/playlist/constants/playlist_constants.dart';
import 'package:igames/features/shared/widgets/small_game_card.dart';

final _getIt = GetIt.instance;

class PlaylistPage extends StatefulWidget {
  final List<Game> games;

  const PlaylistPage({Key? key, required this.games}) : super(key: key);

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  late final GameBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = _getIt<GameBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text(
                playlist,
                style: titleStyle,
              ),
            ),
          ),
          Expanded(
            child: _bloc.selectedGames.toBuild(
              onSuccess: (data) => SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data;
                    return SmallGameCard(
                      pageController: _pageController,
                      games: item,
                      index: index,
                    );
                  },
                ),
              ),
              onLoading: SmallGameCard.shimmer(),
              onError: sectionError(),
            ),
          ),
        ],
      ),
    );
  }
}
