import 'package:animecom/models/DB_model.dart';
import 'package:animecom/models/anime_model.dart';

class AnimeController {
  DataBaseModel _dataBaseModel = DataBaseModel();

  Future getAnime(int uid) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'animes';
    send['condition'] = 'uid = $uid';
    List data = await _dataBaseModel.select(send, "/read");
    return data.length == 0 ? null : Anime.fromJson(data[0]);
  }
}
