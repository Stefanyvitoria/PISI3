import 'package:animecom/models/evaluation_model.dart';

class Anime {
  int _animeUid;
  String _name;
  List<String> _genre;
  String _synopsi;
  DateTime _start;
  DateTime _finish;
  int _episodes;
  String _imgUrl;
  String _link;
  Evaluation _evalution;

  Anime(
      {int animeUid,
      String name,
      List<String> genre,
      String synopsi,
      DateTime start,
      DateTime finish,
      int episodes,
      String imgUrl,
      String link,
      Evaluation evaluation}) {
    this._animeUid = animeUid;
    this._name = name;
    this._genre = genre;
    this._synopsi = synopsi;
    this._start = start;
    this._finish = finish;
    this._episodes = episodes;
    this._imgUrl = imgUrl;
    this._link = link;
    this._evalution = evaluation;
  }

  // ignore: unnecessary_getters_setters
  String get getName => _name;

  // ignore: unnecessary_getters_setters
  List<String> get getGenre => _genre;

  // ignore: unnecessary_getters_setters
  String get getSynopsi => _synopsi;

  // ignore: unnecessary_getters_setters
  DateTime get getStart => _start;

  // ignore: unnecessary_getters_setters
  DateTime get getFinish => _finish;

  // ignore: unnecessary_getters_setters
  int get getEpisodes => _episodes;

  // ignore: unnecessary_getters_setters
  String get getImgUrl => _imgUrl;

  // ignore: unnecessary_getters_setters
  String get getLink => _link;

  // ignore: unnecessary_getters_setters
  String get getEvaluation => _link;

  Anime.fromJson(Map<String, dynamic> json) {
    _animeUid = json['animeUid'];
    _name = json['name'];
    _genre = json['genre'];
    _synopsi = json['synopsi'];
    _start = json['start'];
    _finish = json['finish'];
    _episodes = json['episodes'];
    _imgUrl = json['imgUrl'];
    _link = json['link'];
    _evalution = json['evaluation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['animeUid'] = this._animeUid;
    data['name'] = this._name;
    data['genre'] = this._genre;
    data['synopsi'] = this._synopsi;
    data['start'] = this._start;
    data['finish'] = this._finish;
    data['episodes'] = this._episodes;
    data['imgUrl'] = this._imgUrl;
    data['link'] = this._link;
    data['evaluation'] = this._evalution;
    return data;
  }
}
