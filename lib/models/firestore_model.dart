// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreModel {
//   Future<DocumentReference> add(String collectionName, instanceObject) async {
//     return await FirebaseFirestore.instance
//         .collection(collectionName)
//         .add(instanceObject.toJson());
//   }

//   update(String collectionName, field, fieldResult, instance) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection(collectionName)
//         .where(field, isEqualTo: fieldResult)
//         .get();
//     querySnapshot.docs.forEach(
//       (doc) {
//         FirebaseFirestore.instance
//             .collection(collectionName)
//             .doc(doc.id)
//             .set(instance.toJson());
//       },
//     );
//   }

//   delete(String collectionName, String field, resultfield) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection(collectionName)
//         .where(field, isEqualTo: resultfield)
//         .get();
//     querySnapshot.docs.forEach(
//       (doc) {
//         FirebaseFirestore.instance
//             .collection(collectionName)
//             .doc(doc.id)
//             .delete();
//       },
//     );
//   }

//   get(String collectionName, String field, resultfield) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection(collectionName)
//         .where(field, isEqualTo: resultfield)
//         .get();
//     List result = [];
//     querySnapshot.docs.forEach((doc) {
//       result.add(doc.data());
//     });
//     return result.length > 0 ? result[0] : null;
//   }
// }
