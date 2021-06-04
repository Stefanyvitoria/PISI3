import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreModel {
  Future<DocumentReference> add(String collectionName, instanceObject) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .add(instanceObject.toJson());
  }

  void delete(String collectionName, instanceId) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(instanceId)
        .delete();
  }

  void update(String collectionName, instanceObject, newInstance) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(instanceObject)
        .update(newInstance);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> get(
      String collectionName, instance, field) async {
    return await FirebaseFirestore.instance
        .collection(collectionName)
        .where(field, isEqualTo: instance)
        .get();
  }
}
