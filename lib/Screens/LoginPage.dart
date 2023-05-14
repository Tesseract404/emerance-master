import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State createState() =>_LoginPage();
  }

class _LoginPage extends State<LoginPage>{
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String error =  "";
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim() ,
          password: _passwordController.text.trim(),
      ).then((value) {
        Navigator.pushNamed(context, '/home');
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
         error = e.message!;
      });
    }
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00072D),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.07),
                        child: Image(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*.2,
                          width: MediaQuery.of(context).size.width*.2,
                          image: AssetImage("assets/logo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.014, horizontal: MediaQuery.of(context).size.width*.07),
                  child: Text(
                    'Log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height*.05,
                        horizontal: MediaQuery.of(context).size.width*.07),
                    height: 55,
                    //email textfield
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PlayfairDisplay'
                        ),
                        focusedBorder:
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:   EdgeInsets.fromLTRB(1, 0, 1, 1),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height*.01,
                        horizontal: MediaQuery.of(context).size.width*.07),
                    height: 55,
                    // password textfield
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),
                        labelText:'Password',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PlayfairDisplay'
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                        ),

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02, horizontal: MediaQuery.of(context).size.width*.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 0,
                        child: GestureDetector(
                          onTap: (){
                          },
                          child: Text(
                            " Forgot Password?",
                            style: TextStyle(
                              color: Color(0xFF1d66db),
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),



                Container(
                  margin: EdgeInsets.all(25),
                  height: MediaQuery.of(context).size.height*.053,
                  width: MediaQuery.of(context).size.width*.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),

                      color: Color(0xFF1d66db)
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      signIn();
                    },
                    child: Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 22.5,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02, horizontal: MediaQuery.of(context).size.width*.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " Not a member?.",
                        style: TextStyle(
                            color: Color(0xFF292929),
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 11,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      MaterialButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          " Join now",
                          style: TextStyle(
                            color: Color(0xFF1d66db),
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }


}


