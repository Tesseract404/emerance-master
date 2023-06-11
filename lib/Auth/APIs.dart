import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/Auth/Models/Message.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Models/ChatUser.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  static String getConvoID(String id) =>
      user.uid.hashCode <= id.hashCode
          ? '${user.uid}_$id'
          : '${id}_${user.uid}';


  static Stream<QuerySnapshot<Map<String,dynamic>>> getAllTexts(
      ChatUser user) {
    return firestore
        .collection('chats/${getConvoID(user.userid)}/messages/')
        .snapshots();
  }
  static Future<void> sendMessage(ChatUser chatuser, String msg)async{
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      final Message message= Message(formid: user.uid, msg: msg, read: '', told: chatuser.userid, sent: time);
      final ref= firestore.collection('chats/${getConvoID(chatuser.userid)}/messages/');
      await ref.doc(time).set(message.toJson());
}
}