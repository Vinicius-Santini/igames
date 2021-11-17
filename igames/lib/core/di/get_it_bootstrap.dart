import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Client;
import 'package:igames/core/repositories/game_repository.dart';
import 'package:igames/core/services/base_service.dart';
import 'package:igames/core/services/game_service.dart';
import 'package:igames/core/shared/blocs/game_bloc.dart';

final _getIt = GetIt.instance;

Future<void> boot() async {
  _getIt.registerFactory(() => Client());

  await dotenv.load(fileName: ".env");
  final _apiKey = dotenv.env['API_KEY'] ?? '';
  final _baseUrl = dotenv.env['BASE_URL'] ?? '';

  _getIt.registerFactory<RequestService>(
      () => HttpRequestService(apiKey: _apiKey, baseUrl: _baseUrl));

  _getIt.registerFactory(() => GameService());
  _getIt.registerFactory<GameRepository>(() => HttpGameRepository());

  _getIt.registerSingleton<GameBloc>(GameBloc());
}
