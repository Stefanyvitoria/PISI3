class User {
  String _uid;
  String _name;
  String _email;
  String _urlPhoto;
  String _age;
  String _phone;
  String _password;

  User(uid, name, email, urlPhoto, age, phone, password) {
    this._uid = uid;
    this._name = name;
    this._email = email;
    this._urlPhoto = urlPhoto;
    this._age = age;
    this._phone = phone;
    this._password = password;
  }

  User.fromJson(Map<String, dynamic> json) {
    _uid = json['uid'];
    _name = json['name'];
    _email = json['email'];
    _urlPhoto = json['urlphoto'];
    _age = json['age'];
    _phone = json['phone'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this._uid;
    data['name'] = this._name;
    data['email'] = this._email;
    data['urlphoto'] = this._urlPhoto;
    data['age'] = this._age;
    data['phone'] = this._phone;
    data['password'] = this._password;
    return data;
  }
}
