
import 'package:emerance/Screens/ClaimPage.dart';
import 'package:emerance/Screens/HomePage.dart';
import 'package:emerance/Auth/main_page.dart';
import 'package:emerance/Screens/CarPackagePage.dart';
import 'package:emerance/Screens/SosPage.dart';
import 'package:emerance/Screens/CarPacks/CarBronzePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/CarPacks/CarGoldrPage.dart';
import 'Screens/CarPacks/CarPlatPage.dart';
import 'Screens/CarPacks/CarSilverPage.dart';
import 'Screens/DetailsEdit.dart';
import 'Screens/HealthPackagePage.dart';
import 'Screens/HealthPacks/HealthBronzePage.dart';
import 'Screens/HealthPacks/HealthGoldPage.dart';
import 'Screens/HealthPacks/HealthPlatPage.dart';
import 'Screens/HealthPacks/HealthSilverPage.dart';
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
        '/carpackages' : (context) => const CarPackagePage(),
        '/healthpackages' : (context) => const HealthPackagePage(),
        '/sos' : (context) => const SosPage(),
        '/car_b' : (context) => const CarBronzePage(),
        '/car_s' : (context) => const CarSilverPage(),
        '/car_g' : (context) => const CarGoldPage(),
        '/car_p' : (context) => const CarPlatPage(),
        '/health_b' : (context) => const HealthBronzePage(),
        '/health_s' : (context) => const HealthSilverPage(),
        '/health_g' : (context) => const HealthGoldPage(),
        '/health_p' : (context) => const HealthPlatPage(),

      },
      initialRoute: '/login',
    )
  );
}

