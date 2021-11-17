import 'package:get_it/get_it.dart';
import 'package:http/http.dart' show Response;
import 'base_service.dart';

final getIt = GetIt.instance;

class GameService {
  final RequestService requestService = getIt();

  Future<Response> getGames() async => await requestService.get(
        url: 'games',
      );

  Future<Response> getTopRatedGames() async =>
      await requestService.get(url: 'games', ordering: '-rating');
}
