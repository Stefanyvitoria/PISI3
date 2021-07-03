import 'dart:convert';

import 'package:animecom/controllers/app_controller.dart';
import 'package:animecom/models/api_model.dart';

class Profile {
  int _uid;
  String _name;
  String _email;
  String _password;
  String _gender;
  String _birthday;
  String _phone;

  Profile(
      {int uid,
      String name,
      String email,
      String phone,
      String password,
      String birthday,
      String gender}) {
    this._uid = uid;
    this._name = name;
    this._email = email;
    this._gender = gender;
    this._birthday = birthday;
    this._phone = phone;
    this._password = password;
  }
  // ignore: unnecessary_getters_setters
  int get getUid => _uid;

  // ignore: unnecessary_getters_setters
  String get getName => _name;

  // ignore: unnecessary_getters_setters
  set setName(String name) => _name = name;

  // ignore: unnecessary_getters_setters
  String get getEmail => _email;

  // ignore: unnecessary_getters_setters
  set setEmail(String email) => _email = email;

  // ignore: unnecessary_getters_setters
  String get getGender => _gender;

  // ignore: unnecessary_getters_setters
  set setGender(String urlPhoto) => _gender = urlPhoto;

  // ignore: unnecessary_getters_setters
  String get getbirthday => _birthday;

  // ignore: unnecessary_getters_setters
  set setBirthday(String birthday) => _birthday = birthday;

  // ignore: unnecessary_getters_setters
  String get getPhone => _phone;

  // ignore: unnecessary_getters_setters
  set setPhone(String phone) => _phone = phone;

  // ignore: unnecessary_getters_setters
  String get getPassword => _password;

  // ignore: unnecessary_getters_setters
  set setPassword(String password) => _password = password;

  Profile.fromJson(List data) {
    _uid = data[0];
    _name = data[1];
    _email = data[2];
    _password = data[3];
    _gender = data[4];
    _birthday = data[5];
    _phone = data[6];
  }

  select(String email) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['condition'] = 'email = "$email"';
    var data = await apiRest.call(
      path: "/read",
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );

    return data['result'];
  }

  add(String values) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['fields'] = 'email, pass';
    send['values'] = values;
    await apiRest.call(
      path: "/insert",
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }

  update(String path, Profile user) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['values'] =
        'user_name = "${user.getName}", pass = "${user.getPassword}", gender = "${user.getGender}", birthday = "${user.getbirthday}", phone = "${user.getPhone}"';
    send['condition'] = 'uid = ${user.getUid}';
    await apiRest.call(
      path: "/update",
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }

  delete(int uid, String path) async {
    Map send = new Map<String, dynamic>();
    send['table'] = 'profiles';
    send['condition'] = 'uid = $uid';
    await apiRest.call(
      path: "/delete",
      server: appController.getServer,
      params: {"params": jsonEncode(send)},
    );
  }
}
