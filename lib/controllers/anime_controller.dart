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

  // setUser(String email, String password) async {
  //   await _evaluation.add('"$email", "$password"');
  // }

  // updateUser(Evaluation user) async {
  //   await _evaluation.update("/update", user);
  // }

  // deleteUser(int uid) async {
  //   await _evaluation.delete(uid, '/delete');
  // }
}
