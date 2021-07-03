import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/evaluation_model.dart';

class AnimeController {
  Anime _animeModel = Anime();
  Evaluation _evaluation = Evaluation();

  Future getAnime(int uid) async {
    List data = await _animeModel.select(uid, "/read");
    return data.length == 0 ? null : Anime.fromJson(data[0]);
  }

  Future<Evaluation> getAnimeEvaluation(int uid) async {
    List data = await _evaluation.select(uid);
    return data.length == 0 ? null : Evaluation.fromJson(data[0]);
  }

  setAnime(Anime anime) async {
    await _animeModel.add(
        '"${anime.getName}", "${anime.getSynopsi}", "${anime.getGenre}", ${anime.getEpisodes}');
  }

  updateAnime(Anime anime) async {
    await _animeModel.update(anime);
  }

  deleteAnime(int uid) async {
    await _animeModel.delete(uid);
  }
}
