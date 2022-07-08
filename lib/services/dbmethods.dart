import 'package:cloud_firestore/cloud_firestore.dart';

class DbMethods {
  final _db = FirebaseFirestore.instance.collection("users");

  Future<void> addData(String phoneNumber, Map<String, String> data) {
    print("database method called");
    return _db.doc(phoneNumber).set(data, SetOptions(merge: true));
    // return _db.doc(userid).update(data);
  }

  Future<DocumentSnapshot> checkUser(String phone) {
    return _db.doc(phone).get();
  }
}
