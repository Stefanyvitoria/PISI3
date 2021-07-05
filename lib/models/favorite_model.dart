import 'dart:convert';

import 'package:animecom/controllers/app_controller.dart';
import 'package:animecom/models/api_model.dart';

class Favorite {
  int _userUid;
  int _animeUid;

  get getUserUid => _userUid;

  get getAnimeUid => _animeUid;

  Favorite({userUid, animeUid}) {
    this._userUid = userUid;
    this._animeUid = animeUid;
  }

  Favorite.fromJson(List data) {
    this._userUid = data[0];
    this._animeUid = data[1];
  }

  Future<List> select(int user_uid, String path) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'favorites';
    send['condition'] = 'user_uid= $user_uid';
    var data = await apiRest.call(
      path: path,
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );

    return data['result'];
  }

  setFav(int user_uid, int anime_uid) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'favorites';
    send['fields'] = 'user_uid, anime_uid';
    send['values'] = '$user_uid, $anime_uid';
    await apiRest.call(
      path: '/insert',
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }

  countFav(int user_uid) async {
    Map send = new Map<String, dynamic>();
    send['condition'] = '$user_uid';
    var data = await apiRest.call(
      path: '/countFavorites',
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
    return data['result'];
  }

  delete(int user_uid, int anime_uid) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'favorites';
    send['condition'] = 'user_uid = $user_uid AND anime_uid = $anime_uid';
    await apiRest.call(
      path: '/delete',
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }
}
