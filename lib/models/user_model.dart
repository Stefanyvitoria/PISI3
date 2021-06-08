import 'package:animecom/models/anime_model.dart';

class User {
  int _uid;
  String _name;
  String _email;
  String _urlPhoto;
  int _age;
  String _phone;
  String _password;
  List<Anime> _favorites;

  User(
      {int uid,
      String name,
      String email,
      String urlPhoto,
      int age,
      String phone,
      String password,
      List<Anime> favorites}) {
    this._uid = uid;
    this._name = name;
    this._email = email;
    this._urlPhoto = urlPhoto;
    this._age = age;
    this._phone = phone;
    this._password = password;
    this._favorites = favorites;
  }

  // ignore: unnecessary_getters_setters
  String get getName => _name;

  // ignore: unnecessary_getters_setters
  set setName(String name) => _name = name;

  // ignore: unnecessary_getters_setters
  String get getEmail => _email;

  // ignore: unnecessary_getters_setters
  set setEmail(String email) => _email = email;

  // ignore: unnecessary_getters_setters
  String get getUrlPhoto => _urlPhoto;

  // ignore: unnecessary_getters_setters
  set setUrlPhoto(String urlPhoto) => _urlPhoto = urlPhoto;

  // ignore: unnecessary_getters_setters
  int get getAge => _age;

  // ignore: unnecessary_getters_setters
  set setAge(int age) => _age = age;

  // ignore: unnecessary_getters_setters
  String get getPhone => _phone;

  // ignore: unnecessary_getters_setters
  set setPhone(String phone) => _phone = phone;

  // ignore: unnecessary_getters_setters
  String get getPassword => _password;

  // ignore: unnecessary_getters_setters
  set setPassword(String password) => _password = password;

  // ignore: unnecessary_getters_setters
  List<Anime> get getFavorites => _favorites;

  // ignore: unnecessary_getters_setters
  set setFavorites(List<Anime> favorites) => _favorites = favorites;

  User.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _name = json['name'];
    _email = json['email'];
    _urlPhoto = json['urlPhoto'];
    _age = json['age'];
    _phone = json['phone'];
    _password = json['password'];
    _favorites = json['favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    data['name'] = this._name;
    data['email'] = this._email;
    data['urlPhoto'] = this._urlPhoto;
    data['age'] = this._age;
    data['phone'] = this._phone;
    data['password'] = this._password;
    data['favorites'] = this._favorites;
    return data;
  }
}
