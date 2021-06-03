import 'package:animecom/models/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animecom/models/user_model.dart';

class UserController {
  FirestoreModel firestoreModel = FirestoreModel();

  Future<DocumentReference> addUser({String email, String password}) {
    User user = User('', '', email, '', '', '', password);
    return firestoreModel.add('Users', user);
  }

  void deleteUser(String email, String password) {
    User user = User('', '', email, '', '', '', password);
    return firestoreModel.delete('Users', email);
  }

  updateUser({String email, String password}) {
    User user = User('', '', email, '', '', '', password);
    User newUser = User('', '', email, '', '', '', password);
    return firestoreModel.update('Users', user, newUser);
  }

  getUser(String email) {
    FirestoreModel firestore = new FirestoreModel();
    firestore.get('Users', email, 'email').then((value) {
      if (!value.docs.isEmpty) {
        print(value.docs);
        return value.docs.map((e) => User.fromJson(e.data()));
      } else {}
    });
  }
}
