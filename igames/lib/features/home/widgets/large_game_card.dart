import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/routes/arguments/game_details_arg.dart';
import 'package:igames/core/routes/routes.dart';
import 'package:igames/core/shared/functions/checkImageUrl.dart';
import 'package:shimmer/shimmer.dart';

class LargeGameCard extends StatelessWidget {
  final PageController pageController;
  final List<Game> games;
  final int index;

  const LargeGameCard({
    Key? key,
    required this.pageController,
    required this.index,
    required this.games,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          gameDetails,
          arguments: GameDetailsArg(
            game: games[index],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: games[index],
                    child: SizedBox(
                      height: 220,
                      child: FancyShimmerImage(
                        shimmerBaseColor: mainColor,
                        shimmerHighlightColor: mainColor,
                        imageUrl: checkImageUrl(games[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: 300.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.75),
                        Colors.black.withOpacity(0.25),
                        Colors.black.withOpacity(0.25),
                      ],
                    ),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          games[index].name.toUpperCase(),
                          style: titleStyle.copyWith(color: lightColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget shimmer() {
    return Shimmer.fromColors(
      baseColor: mainColor,
      highlightColor: mainColor,
      enabled: true,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0.0, 4.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: const Center(
          child: SizedBox(
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
