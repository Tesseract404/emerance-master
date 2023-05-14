import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              Text(
                'signed in'
              ),
              MaterialButton(
                  onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              color: Colors.red,
              child: Text ('sign out'),)
            ],
          ),
        ),
      ),
    );
  }
}
