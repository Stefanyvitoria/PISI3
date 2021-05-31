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

class AnimeModel {
  Title title;
  Title synopsis;
  Title genre;
  Title aired;
  Episodes episodes;
  Score score;
  Title imgUrl;

  AnimeModel(
      {this.title,
      this.synopsis,
      this.genre,
      this.aired,
      this.episodes,
      this.score,
      this.imgUrl});

  AnimeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    synopsis =
        json['synopsis'] != null ? new Title.fromJson(json['synopsis']) : null;
    genre = json['genre'] != null ? new Title.fromJson(json['genre']) : null;
    aired = json['aired'] != null ? new Title.fromJson(json['aired']) : null;
    episodes = json['episodes'] != null
        ? new Episodes.fromJson(json['episodes'])
        : null;
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
    imgUrl =
        json['img_url'] != null ? new Title.fromJson(json['img_url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.synopsis != null) {
      data['synopsis'] = this.synopsis.toJson();
    }
    if (this.genre != null) {
      data['genre'] = this.genre.toJson();
    }
    if (this.aired != null) {
      data['aired'] = this.aired.toJson();
    }
    if (this.episodes != null) {
      data['episodes'] = this.episodes.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score.toJson();
    }
    if (this.imgUrl != null) {
      data['img_url'] = this.imgUrl.toJson();
    }
    return data;
  }
}

class Title {
  String s0;

  Title({this.s0});

  Title.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    return data;
  }
}

class Episodes {
  int i0;

  Episodes({this.i0});

  Episodes.fromJson(Map<String, dynamic> json) {
    i0 = json['0'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.i0;
    return data;
  }
}

class Score {
  double d0;

  Score({this.d0});

  Score.fromJson(Map<String, dynamic> json) {
    d0 = json['0'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.d0;
    return data;
  }
}
