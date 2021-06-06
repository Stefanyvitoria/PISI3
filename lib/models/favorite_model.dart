import 'anime_model.dart';

class Favorite {
  String _uid;
  List<Anime> _listAnimes;

  Favorite(uid, listAnimes) {
    this._uid = uid;
    this._listAnimes = listAnimes;
  }

  Favorite.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _listAnimes = json['listAnimes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    data['listAnimes'] = this._listAnimes;
    return data;
  }
}
