class Anime {
  int _uid;
  String _name;
  String _email;
  List<String> _genre;
  String _synopsis;
  String _aired;
  double _episodes;
  int _members;
  int _popularity;
  double _ranked;
  double _score;
  String _imgUrl;
  String _link;

  Anime(uid, name, email, genre, synopsis, aired, episodes, members, popularity,
      ranked, score, imgUrl, link) {
    this._uid = uid;
    this._name = name;
    this._email = email;
    this._genre = genre;
    this._synopsis = synopsis;
    this._aired = aired;
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
    _email = json['email'];
    _genre = json['genre'];
    _synopsis = json['synopsis'];
    _aired = json['aired'];
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
    data['email'] = this._email;
    data['genre'] = this._genre;
    data['synopsis'] = this._synopsis;
    data['aired'] = this._aired;
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
