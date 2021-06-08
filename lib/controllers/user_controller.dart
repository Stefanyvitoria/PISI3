import 'package:animecom/models/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animecom/models/user_model.dart';

class UserController {
  FirestoreModel firestoreModel = FirestoreModel();

  Future<DocumentReference> addUser({String email, String password}) {
    User user = User(email: email, password: password);
    return firestoreModel.add('Users', user);
  }

  void deleteUser(String email, String password) {
    firestoreModel.delete('Users', 'email', email);
  }

  void updateUser(User user) {
    firestoreModel.update('Users', 'email', user.getEmail, user);
  }

  Future<User> getUser(String email) async {
    var data = await firestoreModel.get('Users', 'email', email);
    return data == null ? null : User.fromJson(data);
  }
}
