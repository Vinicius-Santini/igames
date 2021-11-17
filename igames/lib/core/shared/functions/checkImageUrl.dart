import 'package:igames/core/data/game.dart';

final noImageUrl =
    'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1';

String checkImageUrl(Game game) {
  if (game.backgroundImage != null &&
      Uri.parse(game.backgroundImage!).isAbsolute) return game.backgroundImage!;
  return noImageUrl;
}
