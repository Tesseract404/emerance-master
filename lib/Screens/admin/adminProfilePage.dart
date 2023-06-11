import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/widgets/actionButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/ReusableRow.dart';
import '../../widgets/adminWidgets/ReusableRowAdmin.dart';

class adminProfilePage extends StatefulWidget {
  const adminProfilePage({Key? key}) : super(key: key);

  @override
  State<adminProfilePage> createState() => _adminProfilePageState();
}

class _adminProfilePageState extends State<adminProfilePage> {
  final admin = FirebaseAuth.instance;

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
          'Admin Profile',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("admin")
                      .where("userid", isEqualTo: admin.currentUser!.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return Column(
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
                          ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                var data = snapshot.data!.docs[i];
                                return ReusableRowAdmin(
                                    title: 'Username',
                                    iconData: Icons.person_outline_sharp,
                                    value: data['name']);
                              }),
                          ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                var data = snapshot.data!.docs[i];
                                return ReusableRowAdmin(
                                    title: 'Email',
                                    iconData: Icons.mail_outline,
                                    value: data['email']);
                              }),
                          ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                var data = snapshot.data!.docs[i];
                                return ReusableRowAdmin(
                                    title: 'Phone',
                                    iconData: Icons.phone,
                                    value: (data['phone']));
                              }),
                          ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                var data = snapshot.data!.docs[i];
                                return ReusableRowAdmin(
                                    title: 'Password',
                                    iconData: Icons.key,
                                    value: '**********');
                              }),
                          //actionButton(height: 40, width: 190, route: route)
                          SizedBox(
                            height: 250,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: GestureDetector(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Edit Details',
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
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushNamed(context, '/adminedit');
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: GestureDetector(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Log Out',
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
                                  color: Colors.redAccent,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pushNamed(context, '/login');
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
