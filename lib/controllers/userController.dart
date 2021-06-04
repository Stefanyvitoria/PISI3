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
    User user = User(email: email, password: password);
    return firestoreModel.delete('Users', email);
  }

  updateUser({String email, String password}) {
    User user = User(email: email, password: password);
    User newUser = User(email: email, password: password);
    return firestoreModel.update('Users', user, newUser);
  }

  Future<User> getUser(String email) async {
    var data = await firestoreModel.get(
        collectionName: 'Users', field: 'email', resultfield: email);
    return data == null ? null : User.fromJson(data);
  }
}
