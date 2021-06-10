import 'package:animecom/models/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animecom/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  FirestoreModel _firestoreModel = FirestoreModel();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<DocumentReference> addUser({String email, String password}) {
    User user = User(email: email, password: password);
    return _firestoreModel.add('Users', user);
  }

  void deleteUser(String email, String password) {
    _firestoreModel.delete('Users', 'email', email);
  }

  void updateUser(User user) {
    _firestoreModel.update('Users', 'email', user.getEmail, user);
  }

  Future<User> getUser(String email) async {
    var data = await _firestoreModel.get('Users', 'email', email);
    return data == null ? null : User.fromJson(data);
  }

  prefClear() async {
    SharedPreferences prefs = await _prefs;
    prefs.remove('email');
  }

  prefSetUser(String email) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString('email', email);
  }

  prefGetUser() async {
    SharedPreferences prefs = await _prefs;
    String userEmail = prefs.getString('email');
    print('User Email: $userEmail');
    return userEmail;
  }

  loadUser() async {
    String _email = await prefGetUser();
    if (_email == null) return null;
    User user = await getUser(_email);
    return user;
  }
}
