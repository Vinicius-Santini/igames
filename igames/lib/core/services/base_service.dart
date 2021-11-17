import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

abstract class RequestService {
  Future<Response> get({
    required String url,
    int page = 1,
    String? ordering,
  });
}

class HttpRequestService implements RequestService {
  final Client _client = getIt<Client>();

  final String baseUrl;
  final String apiKey;

  HttpRequestService({
    required this.baseUrl,
    required this.apiKey,
  });

  @override
  Future<Response> get({
    required String url,
    int page = 1,
    String? ordering,
  }) async {
    final response = await _client.get(
      Uri.parse(
        "$baseUrl/$url?key=$apiKey&ordering=$ordering",
      ),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Error();
    }
  }
}
