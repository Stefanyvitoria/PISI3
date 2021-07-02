import 'package:animecom/models/anime_model.dart';

class AnimeController {
  Anime _animeModel = Anime();

  Future getAnime(int uid) async {
    List data = await _animeModel.select(uid, "/read");
    return data.length == 0 ? null : Anime.fromJson(data[0]);
  }
}
