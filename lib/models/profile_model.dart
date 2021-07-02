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
  String get getUrlPhoto => _gender;

  // ignore: unnecessary_getters_setters
  set setUrlPhoto(String urlPhoto) => _gender = urlPhoto;

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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    data['name'] = this._name;
    data['email'] = this._email;
    data['gender'] = this._gender;
    data['birthday'] = this._birthday;
    data['phone'] = this._phone;
    data['password'] = this._password;
    return data;
  }
}
