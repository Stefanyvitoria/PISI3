import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreModel {
  Future<DocumentReference> add(String collectionName, instanceObject) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .add(instanceObject.toJson());
  }
}
