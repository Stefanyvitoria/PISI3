import 'dart:convert';

import 'package:animecom/controllers/app_controller.dart';
import 'package:animecom/models/api_model.dart';

class Evaluation {
  int _animeUid;
  int _members;
  int _popularity;
  int _ranked;
  int _score;

  Evaluation({int popularity, int ranked, int score, int members}) {
    this._popularity = popularity;
    this._ranked = ranked;
    this._score = score;
    this._members = members;
  }
  int get getAnimeUid => _animeUid;

  // ignore: unnecessary_getters_setters
  int get getPopularity => _popularity;

  // ignore: unnecessary_getters_setters
  int get getRanked => _ranked;

  // ignore: unnecessary_getters_setters
  int get getScore => _score;

  // ignore: unnecessary_getters_setters
  int get getMembers => _members;

  Evaluation.fromJson(List data) {
    this._animeUid = data[0];
    this._members = data[1];
    this._popularity = data[2];
    this._ranked = data[3];
    this._score = data[4];
  }

  select(int uid) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'evaluation';
    send['condition'] = 'anime_uid = $uid';
    var data = await apiRest.call(
      path: "/read",
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );

    return data['result'];
  }

  // add(String values) async {
  //   Map send = new Map<String, dynamic>();
  //   send['table'] = 'profiles';
  //   send['fields'] = 'email, pass';
  //   send['values'] = values;
  //   await apiRest.call(
  //     path: "/insert",
  //     server: appController.getServer,
  //     params: {"params": jsonEncode(send)},
  //   );
  // }

  // update(String path, user) async {
  //   Map send = new Map<String, dynamic>();
  //   send['table'] = 'profiles';
  //   send['values'] =
  //       'uid = ${user.getUid}, user_name = "${user.getName}", pass = "${user.getPassword}", gender = "${user.getGender}", birthday = "${user.getbirthday}", phone = "${user.getPhone}"';
  //   send['condition'] = 'uid = ${user.getUid}';
  //   await apiRest.call(
  //     path: "/update",
  //     server: appController.getServer,
  //     params: {"params": jsonEncode(send)},
  //   );
  // }

  // delete(int uid, String path) async {
  //   Map send = new Map<String, dynamic>();
  //   send['table'] = 'profiles';
  //   send['condition'] = 'uid = $uid';
  //   await apiRest.call(
  //     path: "/delete",
  //     server: appController.getServer,
  //     params: {"params": jsonEncode(send)},
  //   );
  // }
}
