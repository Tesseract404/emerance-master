import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/Auth/user_model.dart';
import 'package:get/get.dart';
class UserRepository extends GetxController{

    static UserRepository get instance => Get.find();

    final _db = FirebaseFirestore.instance;
    
    creatUser(UserModel user) async {
     await _db.collection("Users").add(user.toJson()).whenComplete(
              () => Get.snackbar("Success", "Your account has been created!",
              snackPosition: SnackPosition.BOTTOM,
              ),

      );
    }
}