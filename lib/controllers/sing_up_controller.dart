import 'package:animecom/models/firestore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animecom/models/user_model.dart';

class SingUpController {
  FirestoreModel firestoreModel = FirestoreModel();

  Future<DocumentReference> addUser({String email, String password}) {
    User user = User('', '', email, '', '', '', password);
    return firestoreModel.add('Users', user);
  }
}
