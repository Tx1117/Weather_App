import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );

  Future<void> addUser(String uid, String email) async {
    await users.doc(uid).set({'email': email});
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await users.doc(uid).update(data);
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    return await users.doc(uid).get();
  }

  Future<void> deleteUser(String uid) async {
    await users.doc(uid).delete();
  }
}
