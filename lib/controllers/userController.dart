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

  Future getUser(String email) async {
    FirestoreModel firestore = new FirestoreModel();
    return await firestore.get('Users', email, 'email');
  }
}
