import 'package:emerance/Screens/LoginPage.dart';
import 'package:emerance/Screens/SignUpPage.dart';
import 'package:flutter/material.dart';
class Authpage extends StatefulWidget {
  const Authpage({Key? key}) : super(key: key);

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {

  bool showloginpage = true;
  @override
  Widget build(BuildContext context) {
    if (showloginpage){
      return LoginPage();
    }else{
      return SignUpPage();
    }
  }
}
