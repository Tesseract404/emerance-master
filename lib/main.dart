
import 'package:emerance/Screens/ClaimPage.dart';
import 'package:emerance/Screens/HomePage.dart';
import 'package:emerance/Auth/main_page.dart';
import 'package:emerance/Screens/PackagePage.dart';
import 'package:emerance/Screens/SosPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/DetailsEdit.dart';
import 'Screens/LandingPage.dart';
import 'Screens/LoginPage.dart';
import 'Screens/SignUpPage.dart';
import 'Screens/UserProfilePage.dart';
import 'Screens/ClaimPage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: "Emerence",
      routes: {
        '/': (context) =>  LandingPage(),
        '/login' : (context) => LoginPage(),
        '/signup' : (context) =>   SignUpPage(),
        '/userProfile' : (context) => const UserProfilePage(),
        '/home' : (context) => const HomePage(),
        '/editD' : (context) => const DetailsEdit(),
        '/claim' : (context) => const ClaimPage(),
        '/packages' : (context) => const PackagePage(),
        '/sos' : (context) => const SosPage(),

      },
      initialRoute: '/login',
    )
  );
}

