import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:animecom/models/user_model.dart';

class SingUpController {
  Future<DocumentReference> addUser({String email, String password}) async {
    User user = User('', '', email, '', '', '', password);
    return await FirebaseFirestore.instance
        .collection('Users')
        .add(user.toJson());
  }
}
