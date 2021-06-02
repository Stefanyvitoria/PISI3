class Anime {
  String _uid;
  String _name;
  String _email;
  List _genre;
  String _synopsi;
  DateTime _aired;
  int _episode;
  int _member;
  int _popularity;
  int _ranked;
  double _score;
  String _imgUrl;
  String _link;

  Anime(uid, name, emial, genre, synopsi, aired, episode, member, popularity,
      ranked, score, imgUrl, link) {
    this._uid = uid;
    this._name = name;
    this._email = emial;
    this._genre = genre;
    this._synopsi = synopsi;
    this._aired = aired;
    this._episode = episode;
    this._member = member;
    this._popularity = popularity;
    this._ranked = ranked;
    this._score = score;
    this._imgUrl = imgUrl;
    this._link = link;
  }

  Anime.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _name = json['name'];
    _email = json['email'];
    _genre = json['genre'];
    _synopsi = json['synopsi'];
    _aired = json['aired'];
    _episode = json['episode'];
    _member = json['member'];
    _popularity = json['popularity'];
    _ranked = json['ranked'];
    _score = json['score'];
    _imgUrl = json['img_url'];
    _link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    data['name'] = this._name;
    data['email'] = this._email;
    data['genre'] = this._genre;
    data['synopsi'] = this._synopsi;
    data['aired'] = this._aired;
    data['episode'] = this._episode;
    data['member'] = this._member;
    data['popularity'] = this._popularity;
    data['ranked'] = this._ranked;
    data['score'] = this._score;
    data['img_url'] = this._imgUrl;
    data['link'] = this._link;
    return data;
  }
}
