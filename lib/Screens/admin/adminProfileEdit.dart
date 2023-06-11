import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/adminWidgets/editRow.dart';
class adminProfileEdit extends StatefulWidget {
  const adminProfileEdit({Key? key}) : super(key: key);

  @override
  State<adminProfileEdit> createState() => _adminProfileEditState();
}

class _adminProfileEditState extends State<adminProfileEdit> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    //_getProfileData();
  }

  // void _getProfileData() async {
  //   final User? user = await _auth.currentUser;
  //   _name = user?.name;
  //   _email = user?.email!;
  // }

  void _updateProfileData() {
    _database.child('admin/${_auth.currentUser?.uid}').update({
      'name': _name,
      'email': _email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebebeb),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFebebeb),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            CupertinoIcons.back,
            color: Colors.black87,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Admin Profile',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  CupertinoIcons.person_crop_circle,
                  size: 75,
                  color: Colors.green,
                ),
              ),
            ),
            Form(
                child:Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      editRow(title:'Name :',val: 'dsdfsfdssdf',),
                      editRow(title:'Phone :',val: 'dsfsdfsf',),
                      editRow(title:'Email :',val: 'dsfdsdfsf',),

                    ],
                  ),
                )
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: GestureDetector(
                child: Container(
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  height: 40,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                ),
                onTap: () {
                  setState(() {

                  });
                },
              ),
            ),Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: GestureDetector(
                child: Container(
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  height: 40,
                  width: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {

                  });
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
