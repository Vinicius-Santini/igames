import 'package:flutter/material.dart';
import 'package:igames/core/routes/arguments/game_details_arg.dart';
import 'package:igames/features/game/game_page.dart';
import 'package:igames/features/home/home_page.dart';

const homeRoute = "/home";
const gameDetails = "/game_details";

final Map<String, WidgetBuilder> igamesRoutes = {
  homeRoute: (BuildContext context) => const HomePage(),
  gameDetails: (BuildContext context) => GamePage(
        args: getArg<GameDetailsArg>(context),
      )
};

T getArg<T>(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments as T;
