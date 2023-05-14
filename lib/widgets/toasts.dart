
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class toasts {
  static void toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    backgroundColor: Color(0xffb5b5b5),
        textColor: Colors.black,
        fontSize: 13
    );
  }
}


 