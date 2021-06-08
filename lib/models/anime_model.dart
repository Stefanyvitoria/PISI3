class Anime {
  int _uid;
  String _name;
  List<String> _genre;
  String _synopsis;
  String _start;
  String _finish;
  double _episodes;
  int _members;
  int _popularity;
  double _ranked;
  double _score;
  String _imgUrl;
  String _link;

  Anime(uid, name, email, genre, synopsis, start, finish, episodes, members,
      popularity, ranked, score, imgUrl, link) {
    this._uid = uid;
    this._name = name;
    this._genre = genre;
    this._synopsis = synopsis;
    this._start = start;
    this._episodes = episodes;
    this._members = members;
    this._popularity = popularity;
    this._ranked = ranked;
    this._score = score;
    this._imgUrl = imgUrl;
    this._link = link;
  }

  Anime.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _name = json['name'];
    _genre = json['genre'];
    _synopsis = json['synopsis'];
    _start = json['start'];
    _finish = json['finish'];
    _episodes = json['episodes'];
    _members = json['members'];
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
    data['genre'] = this._genre;
    data['synopsis'] = this._synopsis;
    data['start'] = this._start;
    data['finish'] = this._finish;
    data['episode'] = this._episodes;
    data['member'] = this._members;
    data['popularity'] = this._popularity;
    data['ranked'] = this._ranked;
    data['score'] = this._score;
    data['img_url'] = this._imgUrl;
    data['link'] = this._link;
    return data;
  }
}
