class User {
  String _uid;
  String _name;
  String _email;
  String _urlPhoto;
  String _age;
  String _phone;
  String _password;

  User(
      {String uid,
      String name,
      String email,
      String urlPhoto,
      String age,
      String phone,
      String password}) {
    this._uid = uid;
    this._name = name;
    this._email = email;
    this._urlPhoto = urlPhoto;
    this._age = age;
    this._phone = phone;
    this._password = password;
  }

  String get uid => _uid;
  set uid(String uid) => _uid = uid;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get urlPhoto => _urlPhoto;
  set urlPhoto(String urlPhoto) => _urlPhoto = urlPhoto;
  String get age => _age;
  set age(String age) => _age = age;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get password => _password;
  set password(String password) => _password = password;

  User.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _name = json['name'];
    _email = json['email'];
    _urlPhoto = json['urlPhoto'];
    _age = json['age'];
    _phone = json['phone'];
    _password = json['password'];
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
    return data;
  }
}
