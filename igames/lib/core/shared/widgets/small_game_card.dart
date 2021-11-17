import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:igames/core/data/game.dart';
import 'package:igames/core/routes/arguments/game_details_arg.dart';
import 'package:igames/core/routes/routes.dart';
import 'package:igames/core/shared/functions/checkImageUrl.dart';
import 'package:shimmer/shimmer.dart';

class SmallGameCard extends StatelessWidget {
  final PageController pageController;
  final List<Game> games;
  final int index;

  const SmallGameCard({
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
            height: Curves.easeInOut.transform(value) * 180.0,
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
        child: Center(
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0.0, 4.0),
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Container(
              color: mainColor,
              child: Row(
                children: [
                  Hero(
                    tag: games[index],
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        height: 70,
                        width: 140,
                        child: FancyShimmerImage(
                            shimmerBaseColor: mainColor,
                            shimmerHighlightColor: mainColor,
                            imageUrl: checkImageUrl(games[index])),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 20.0),
                    child: Container(
                      width: 160.0,
                      height: 100.0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              games[index].name,
                              style: subTitleStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget shimmer() {
    return Shimmer.fromColors(
      baseColor: mainColor,
      highlightColor: mainColor,
      enabled: true,
      child: Container(),
    );
  }
}
