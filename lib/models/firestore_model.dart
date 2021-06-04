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

  get({String collectionName, String field, resultfield}) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .where(field, isEqualTo: resultfield)
        .get();
    List result = [];
    querySnapshot.docs.forEach((doc) {
      result.add(doc.data());
    });
    return result.length > 0 ? result[0] : null;
  }
}
