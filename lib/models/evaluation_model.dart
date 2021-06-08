class Evaluation {
  int _popularity;
  int _ranked;
  double _score;
  int _members;

  Evaluation({int popularity, int ranked, double score, int members}) {
    this._popularity = popularity;
    this._ranked = ranked;
    this._score = score;
    this._members = members;
  }
  // ignore: unnecessary_getters_setters
  int get popularity => _popularity;

  // ignore: unnecessary_getters_setters
  int get ranked => _ranked;

  // ignore: unnecessary_getters_setters
  double get score => _score;

  // ignore: unnecessary_getters_setters
  int get members => _members;

  Evaluation.fromJson(Map<String, dynamic> json) {
    _popularity = json['popularity'];
    _ranked = json['ranked'];
    _score = json['score'];
    _members = json['members'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popularity'] = this._popularity;
    data['ranked'] = this._ranked;
    data['score'] = this._score;
    data['members'] = this._members;
    return data;
  }
}
