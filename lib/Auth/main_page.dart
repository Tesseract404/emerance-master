import 'package:emerance/Screens/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/HomePage.dart';
import 'Authpage.dart';

class main_page extends StatelessWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            return HomePage();
          }else{
            return Authpage();
          }
        },
      ),
    );
  }
}
