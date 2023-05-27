
import 'package:emerance/Screens/Insurance/Ins_Details.dart';
import 'package:emerance/Screens/Insurance/InsuranceDashboard.dart';
import 'package:emerance/Screens/HomePage.dart';
import 'package:emerance/Auth/main_page.dart';
import 'package:emerance/Screens/CarPackagePage.dart';
import 'package:emerance/Screens/SosPage.dart';
import 'package:emerance/Screens/CarPacks/CarBronzePage.dart';
import 'package:emerance/Screens/submitDetailsPage.dart';
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
import 'Screens/Map.dart';
import 'Screens/SignUpPage.dart';
import 'Screens/UserProfilePage.dart';
import 'Screens/Insurance/InsuranceDashboard.dart';

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
        '/insurancedash' : (context) => const InsuranceDashboard(),
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
        '/map' : (context) =>  const Maps(),
        '/submit' : (context) =>  const submitDetailsPage(),
        '/ins_details' : (context) =>  const Ins_Details(plan: 'asad', image: ' dasd', name: ' dsa1', model: 'das1', year: ' ads1', vNo: 'asas1 ',exDate: 'sadad',),

      },
      initialRoute: '/login',
    )
  );
}

