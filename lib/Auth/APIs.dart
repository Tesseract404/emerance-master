import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs{
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  static Stream<QuerySnapshot<Map<String,dynamic>>> getAllTexts(){
    return firestore
        .collection('messages')
        .snapshots();
  }
}