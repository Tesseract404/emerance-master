import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget{
  @override
  State  createState() => _LandingPage();
}
class _LandingPage extends State<LandingPage>{
  @override
  Widget build(BuildContext context) {// decoration: BoxDecoration(
    //   image: DecorationImage(
    //       image: AssetImage("asset/bgphoto.png"),
    //     fit: BoxFit.cover
    //   )
    // ),
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/bgphoto.png'),
              fit: BoxFit.cover,
            ),
          ),
          height: 900,
          width: 500,
          child: SafeArea(
            child: Container(
                child: Padding(
                  padding: EdgeInsets.all(80),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(),flex: 1,),
                      Expanded(
                        child: Container(
                          child: Image(
                            image: AssetImage(
                                "assets/logo.png"),
                          ),
                          height: 100 ,
                          width: 100,
                        ),

                        flex: 1,
                      ),
                      Container(),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.all(5),child: Text(
                                'Welcome To',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 38,
                                  fontFamily: 'PLayfairDisplay',
                                ),
                              ),),

                              Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  'Emerance',
                                  textAlign: TextAlign.center,

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 40,
                                    fontFamily: 'PLayfairDisplay',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          height: 250,
                          width: 300,
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                          child: Container(
                            width: MediaQuery.of(context).size.width*.6,
                            height: MediaQuery.of(context).size.height*.1,
                            margin: EdgeInsets.all(5),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 2,color: Colors.black),
                              color: Color(0xFF1d66db),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                "Log in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlayfairDisplay',
                                    fontSize: 21.5,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );

  }
}