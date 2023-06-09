
import 'package:emerance/Screens/HomePage.dart';
import 'package:emerance/Screens/UserProfilePage.dart';
import 'package:emerance/Auth/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/LandingPage.dart';
import 'Screens/LoginPage.dart';
import 'Screens/SignUpPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: "Emerence",
      routes: {
        '/': (context) =>   LandingPage(),
        '/login' : (context) => LoginPage(),
        '/signup' : (context) =>   SignUpPage(),
        '/userProfile' : (context) => UserProfilePage(),
        '/mainpage' : (context) => main_page(),
        '/home' : (context) => HomePage(),
      },
      initialRoute: '/login',
    )
  );
}

