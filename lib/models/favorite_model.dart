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

  Future<List> select(int uid, String path) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'favorites';
    send['condition'] = 'user_uid = $uid';
    var data = await apiRest.call(
      path: path,
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );

    return data['result'];
  }

  call(String path, Map send) async {
    await apiRest.call(
      path: path,
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }
}
