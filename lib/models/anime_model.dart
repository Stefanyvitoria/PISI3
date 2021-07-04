import 'dart:convert';

import 'package:animecom/controllers/app_controller.dart';
import 'package:animecom/models/api_model.dart';

class Anime {
  int _animeUid;
  String _title;
  String _synopsis;
  String _genre;
  String _airedStart;
  String _airedFinish;
  int _episodes;
  String _imgUrl;
  String _link;

  Anime({
    int animeUid,
    String title,
    String synopsi,
    String genre,
    String start,
    String finish,
    int episodes,
    String imgUrl,
    String link,
  }) {
    this._animeUid = animeUid;
    this._title = title;
    this._genre = genre;
    this._synopsis = synopsi;
    this._airedStart = start;
    this._airedFinish = finish;
    this._episodes = episodes;
    this._imgUrl = imgUrl;
    this._link = link;
  }
  int get getAnimeUid => _animeUid;

  // ignore: unnecessary_getters_setters
  String get getName => _title;

  // ignore: unnecessary_getters_setters
  String get getGenre => _genre;

  // ignore: unnecessary_getters_setters
  String get getSynopsi => _synopsis;

  // ignore: unnecessary_getters_setters
  String get getStart => _airedStart;

  // ignore: unnecessary_getters_setters
  String get getFinish => _airedFinish;

  // ignore: unnecessary_getters_setters
  int get getEpisodes => _episodes;

  // ignore: unnecessary_getters_setters
  String get getImgUrl => _imgUrl;

  // ignore: unnecessary_getters_setters
  String get getLink => _link;

  Anime.fromJson(List data) {
    this._animeUid = data[0];
    this._title = data[1];
    this._synopsis = data[2];
    this._genre = data[3];
    this._airedStart = data[4];
    this._airedFinish = data[5];
    this._episodes = data[6];
    this._imgUrl = data[7];
    this._link = data[8];
  }
  Future animesListe() async {}
  Future<List> select(int uid, String path) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'animes';
    send['condition'] = 'uid = $uid';
    var data = await apiRest.call(
      path: path,
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
    return data['result'];
  }

  Future<List> selectbyGenre(String genre, String path) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'animes';
    send['condition'] = "genre LIKE '%$genre%'";
    var data = await apiRest.call(
      path: path,
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
    return data['result'];
  }

  Future<List> selectbyScore(int score, String path) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'animes';
    send['condition'] = "score > $score";
    var data = await apiRest.call(
      path: path,
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
    return data['result'];
  }

  Future<List> clusterization(String text) async {
    Map send = new Map<String, dynamic>();
    Map send1 = new Map<String, dynamic>();
    send['text'] = text;
    var data = await apiRest.call(
        path: "/clusterization",
        server: appController.getServer,
        params: {"params": jsonEncode(send)});
    send1['table'] = 'animes';
    send1['condition'] =
        "A.uid IN ${data['animes_uid'].toString().replaceAll('[', '(').replaceAll(']', ')')}";
    var data1 = await apiRest.call(
        path: "/readCluster",
        server: appController.getServer,
        params: {"params": jsonEncode(send1)});
    return data1['result'];
  }

  add(String values) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'animes';
    send['fields'] = 'title, synopsis, genre, episodes';
    send['values'] = values;
    await apiRest.call(
      path: "/insert",
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }

  update(dynamic anime) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'animes';
    send['values'] =
        'title = "${anime.getName}", gender = "${anime.getGender}", synopsis = "${anime.getSynopsis}", episodes = ${anime.getEpisodes}';
    send['condition'] = 'uid = ${anime.getUid}';
    await apiRest.call(
      path: "/update",
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }

  delete(int uid) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'animes';
    send['condition'] = 'uid = $uid';
    await apiRest.call(
      path: "/delete",
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }
}
