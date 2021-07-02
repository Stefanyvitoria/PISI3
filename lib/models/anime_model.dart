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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animeUid'] = this._animeUid;
    data['name'] = this._title;
    data['genre'] = this._genre;
    data['synopsi'] = this._synopsis;
    data['start'] = this._airedStart;
    data['finish'] = this._airedFinish;
    data['episodes'] = this._episodes;
    data['imgUrl'] = this._imgUrl;
    data['link'] = this._link;
    return data;
  }
}
