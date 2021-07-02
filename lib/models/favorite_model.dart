class Favorite {
  int _userUid;
  int _animeUid;

  get getUserUid => _userUid;

  get getAnimeUid => _animeUid;

  Favorite(userUid, animeUid) {
    this._userUid = userUid;
    this._animeUid = animeUid;
  }

  Favorite.fromJson(List data) {
    this._userUid = data[0];
    this._animeUid = data[1];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_uid'] = this._userUid;
    data['anime_uid'] = this._animeUid;
    return data;
  }
}
