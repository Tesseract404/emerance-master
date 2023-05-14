import 'package:emerance/widgets/BoxbuttonWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebebeb),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ClipRRect(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 5.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(25)),
                      color: Colors.black87),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          CupertinoIcons.bars,
                          color: Colors.blueAccent,
                          size: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          'Emerance',
                          style: TextStyle(
                            fontFamily: 'Academy Engraved LET',
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(45, 170, 0, 0),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white70,
                          size: 25,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/userProfile');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 170, 0, 0),
                          child: Icon(
                            Icons.person,
                            color: Colors.white70,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Center(
                          child: BoxbuttonWidget(
                        title: 'Our Car Insurance Plans',
                        iconData: CupertinoIcons.car_detailed,
                        color: Colors.white,
                        routeName: '/packages',
                        iconcolor: Colors.black45,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Center(
                          child: BoxbuttonWidget(
                        title: 'Our Health Insurance Plans',
                        iconData: CupertinoIcons.heart_fill,
                        color: Colors.white,
                        routeName: '/packages',
                        iconcolor: Colors.redAccent,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Center(
                          child: BoxbuttonWidget(
                        title: 'Claim Insurance',
                        iconData: CupertinoIcons.money_dollar_circle_fill,
                        color: Colors.white,
                        routeName: '/claim',
                        iconcolor: Colors.amber,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child:  Center(
                        child: GestureDetector(
                          onTap: () { Navigator.pushNamed(context, '/sos'); },
                          child: Container(
                            height: MediaQuery.of(context).size.height * .28,
                            width: MediaQuery.of(context).size.width * .65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(180),
                            ),
                            child: Image(
                              image: AssetImage('assets/Sos.png'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
