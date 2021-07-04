import 'package:animecom/models/anime_model.dart';
import 'package:animecom/models/evaluation_model.dart';

class AnimeController {
  Anime _animeModel = Anime();
  Evaluation _evaluation = Evaluation();

  Future getAnime(int uid) async {
    List data = await _animeModel.select(uid, "/read");
    return data.length == 0 ? null : Anime.fromJson(data[0]);
  }

  Future getAnimebyGenre(String genre) async {
    List data = await _animeModel.selectbyGenre(genre, "/readAll");
    return data.length == 0 ? null : data;
  }

  Future getAnimebyScore(int score) async {
    List data = await _animeModel.selectbyScore(score, "/readAll");
    return data.length == 0 ? null : data;
  }

  Future getAnimeEvaluation(int uid) async {
    List data = await _evaluation.select(uid);
    return data.length == 0 ? null : Evaluation.fromJson(data[0]);
  }

  Future getClusterization(String text) async {
    List data = await _animeModel.clusterization(text);
    return data.length == 0 ? null : data;
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

  String imgGetter(img) {
    try {
      if (img == null) {
        return 'https://media.tenor.com/images/c9eea6032bb3da2900131f59e2f03f3c/tenor.gif';
      } else {
        return img;
      }
    } catch (e) {
      return 'https://media.tenor.com/images/c9eea6032bb3da2900131f59e2f03f3c/tenor.gif';
    }
  }

  String stringGetter(string) {
    try {
      if (string == null) {
        return 'Not Found';
      } else {
        return string;
      }
    } catch (e) {
      return 'Not Found';
    }
  }

  int numbGetter(numb) {
    try {
      if (numb == null) {
        return 0;
      } else {
        return numb;
      }
    } catch (e) {
      return 0;
    }
  }
}
