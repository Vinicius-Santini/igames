import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:design_system/design_system.dart';
import 'package:igames/core/shared/blocs/game_bloc.dart';
import 'package:igames/features/home/constants/home_constants.dart';
import 'package:igames/features/home/widgets/large_game_card.dart';
import 'package:igames/features/home/widgets/section_error.dart';
import 'package:igames/features/playlist/playlist_page.dart';
import 'package:igames/core/shared/widgets/small_game_card.dart';

final _getIt = GetIt.instance;

class HomePage extends StatefulWidget {
  final GameBloc? bloc;
  const HomePage({Key? key, this.bloc}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  late final GameBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc ?? _getIt<GameBloc>();
    _bloc.getGames();
    _bloc.getTopRatedGames();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            backgroundColor,
            backgroundColor.withOpacity(0.75),
            backgroundColor.withOpacity(0.25),
            mainColor.withOpacity(0.25),
          ],
        ),
      ),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: mainColor,
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlaylistPage(games: [])),
              ),
              icon: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              tooltip: 'My playlist',
            )
          ],
          title: _buildTitle(),
          elevation: 0.75,
        ),
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            _buildGames(),
            _buildTopRatedGames(),
          ],
        ),
      ),
    );
  }

  Center _buildTitle() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 45.0),
        child: Text(
          homeTitle,
          style: titleStyle,
        ),
      ),
    );
  }

  Widget _buildGames() => _bloc.games.toBuild(
        onSuccess: (data) => Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  recommendedGames,
                  style: titleStyle,
                ),
              ),
            ),
            SizedBox(
              height: 225.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = data;
                  return LargeGameCard(
                    pageController: _pageController,
                    games: item,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
        onLoading: LargeGameCard.shimmer(),
        onError: sectionError(),
      );

  Widget _buildTopRatedGames() => _bloc.topRatedGames.toBuild(
        onSuccess: (data) => Column(
          children: [
            Center(
              child: Text(
                topRated,
                style: titleStyle,
              ),
            ),
            SizedBox(
              height: 1000.0,
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
          ],
        ),
        onLoading: SmallGameCard.shimmer(),
        onError: sectionError(),
      );
}
