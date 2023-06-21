import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/Auth/Models/ChatUser.dart';
import 'package:emerance/Screens/Insurance/carClaimPage.dart';
import 'package:emerance/Screens/Insurance/InsuranceDashboard.dart';
import 'package:emerance/Screens/HomePage.dart';
import 'package:emerance/Auth/main_page.dart';
import 'package:emerance/Screens/CarPackagePage.dart';
import 'package:emerance/Screens/MapMechanic.dart';
import 'package:emerance/Screens/SosPage.dart';
import 'package:emerance/Screens/CarPacks/CarBronzePage.dart';
import 'package:emerance/Screens/admin/adminDashPage.dart';
import 'package:emerance/Screens/admin/adminProfileEdit.dart';
import 'package:emerance/Screens/admin/adminProfilePage.dart';
import 'package:emerance/Screens/admin/claimListPage.dart';
import 'package:emerance/Screens/approvalPage.dart';
import 'package:emerance/Screens/callPage.dart';
import 'package:emerance/Screens/chatListPage.dart';
import 'package:emerance/Screens/submitDetailsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/CarPacks/CarGoldrPage.dart';
import 'Screens/CarPacks/CarPlatPage.dart';
import 'Screens/CarPacks/CarSilverPage.dart';
import 'Screens/CarPacks/carDetailsPage.dart';
import 'Screens/ChattingPage.dart';
import 'Screens/DetailsEdit.dart';
import 'Screens/HealthPackagePage.dart';
import 'Screens/HealthPacks/HealthBronzePage.dart';
import 'Screens/HealthPacks/HealthGoldPage.dart';
import 'Screens/HealthPacks/HealthPlatPage.dart';
import 'Screens/HealthPacks/HealthSilverPage.dart';
import 'Screens/HealthPacks/healthDetailsPage.dart';
import 'Screens/Insurance/healthClaimPage.dart';
import 'Screens/LandingPage.dart';
import 'Screens/LoginPage.dart';
import 'Screens/MapAmbulance.dart';
import 'Screens/MapTow.dart';
import 'Screens/SignUpPage.dart';
import 'Screens/UserProfilePage.dart';
import 'Screens/Insurance/InsuranceDashboard.dart';
import 'Screens/admin/incomeStatementPage.dart';
import 'Screens/admin/salesPage.dart';
import 'Screens/paymentGatewayPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: "Emerence",
    routes: {
      '/': (context) => LandingPage(),
      '/login': (context) => LoginPage(),
      '/signup': (context) => SignUpPage(),
      '/userProfile': (context) => const UserProfilePage(),
      '/home': (context) => const HomePage(),
      '/editD': (context) => const DetailsEdit(),
      '/insurancedash': (context) => const InsuranceDashboard(),
      '/carpackages': (context) => const CarPackagePage(),
      '/healthpackages': (context) => const HealthPackagePage(),
      '/sos': (context) => const SosPage(),
      '/car_b': (context) => const CarBronzePage(),
      '/car_s': (context) => const CarSilverPage(),
      '/car_g': (context) => const CarGoldPage(),
      '/car_p': (context) => const CarPlatPage(),
      '/carDetails': (context) => const carDetailsPage(),
      '/healthDetails': (context) => const healthDetailsPage(),
      '/health_b': (context) => const HealthBronzePage(),
      '/health_s': (context) => const HealthSilverPage(),
      '/health_g': (context) => const HealthGoldPage(),
      '/health_p': (context) => const HealthPlatPage(),
      '/map_a': (context) => const MapAmbulance(),
      '/map_t': (context) => const MapTow(),
      '/map_m': (context) => const MapMechanic(),
      '/submit': (context) => const submitDetailsPage(),
      '/carclaim': (context) => const carClaimPage(),
      '/healthclaim': (context) => const healthClaimPage(),
      '/call': (context) => const callPage(),
      '/adminDash': (context) => const adminDashPage(),
      '/adminprofile': (context) => const adminProfilePage() ,
      '/payment': (context) => const paymentGatewayPage() ,
      '/sales': (context) => const salesPage() ,
      '/claimList': (context) => const claimListPage() ,
      '/adminedit': (context) => const adminProfileEdit() ,
      '/income': (context) => const incomeStatementPage() ,
      '/approval': (context) => const approvalPage() ,
      '/chatlist': (context) => const chatListPage() ,
      '/chat': (context) => ChattingPage(

          user: FirebaseAuth.instance.currentUser!.uid!='454Nz0FjQOSz20uJlbXfTqFe8l92'?
          ChatUser(
              address: 'banani',
              dateofbirth: '02-05-2023',
              email: 'rain@gmail.com',
              image: ' ',
              insurance: 'Car & Health Insurace',
              name: 'Ambulance',
              password: '123456',
              phone: '01224422164',
              userid: '454Nz0FjQOSz20uJlbXfTqFe8l92'
            //FirebaseFirestore.instance.collection('User').doc('454Nz0FjQOSz20uJlbXfTqFe8l92')
          ):ChatUser(
              address: 'silicon valley',
              dateofbirth: '04-05-2016',
              email: 'jawad@gmail.com',
              image: ' ',
              insurance: 'Car & Health Insurace',
              name: 'jawad rahman',
              password: '123456',
              phone: '23111113651',
              userid: 'HiAqbvTLXgQ3tuSZYLYXB881I7b2'
            //FirebaseFirestore.instance.collection('User').doc('454Nz0FjQOSz20uJlbXfTqFe8l92')
          )),
    },
    initialRoute: '/home',
    // home: AnimatedSplashScreen(
    //   duration: 3000,
    //   splashTransition: SplashTransition.fadeTransition,
    //   splash: Image(
    //     image: AssetImage('assets/logo.png'),
    //   ), nextScreen: SosPage(),
    // ),
  ));
}
