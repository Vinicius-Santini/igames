import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igames/core/di/get_it_bootstrap.dart';
import 'package:igames/core/routes/routes.dart';

import 'features/home/home_page.dart';

void main() async {
  // start dependency injection
  await boot();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IGames',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: const HomePage(),
      routes: igamesRoutes,
    );
  }
}
