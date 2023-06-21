import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/adminWidgets/editRow.dart';
import '../widgets/userEditRow.dart';

class DetailsEdit extends StatefulWidget {
  const DetailsEdit({Key? key}) : super(key: key);

  @override
  State<DetailsEdit> createState() => _DetailsEditState();
}

class _DetailsEditState extends State<DetailsEdit> {
  static final user = FirebaseAuth.instance.currentUser!.uid;
  late  TextEditingController _nameController ;
  late  TextEditingController _emailController ;
  late  TextEditingController _phoneController ;
  late  TextEditingController _dobController ;
  late  TextEditingController _addressController ;
  // final _emailController = TextEditingController();
  // final _nameController = TextEditingController();
  // final _dobController = TextEditingController();
  // final _phoneController = TextEditingController();
  // final _addressController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
  }
  Future updateUser() async {
     update(
         _nameController.text.trim(),
         _dobController.text.trim(),
         _emailController.text.trim(),
         _phoneController.text.trim(),
         _addressController.text.trim(),
     );

  }
  Future update(String _name, String _dob, String _email, String _phone,
      String _address) async{
    await FirebaseFirestore.instance.collection('User').doc(user).update({
      'name': _name,
      'email': _email,
      'phone': _phone,
      'dateofbirth': _dob,
      'address': _address,
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
          'Edit Your Information',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'PlayfairDisplay',
            fontSize: 19,
            fontWeight: FontWeight.w500,
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
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: StreamBuilder(
                  ///working
                  stream: FirebaseFirestore.instance
                      .collection("User")
                      .where("userid", isEqualTo: user )
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  var data = snapshot.data!.docs[i];
                               _nameController = TextEditingController(text: data['name']);
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex:2,
                                        child: Text('Username :',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Expanded(
                                        flex:5,
                                        child:TextField(
                                           //initialValue: data['name'] ,
                                            controller: _nameController,
                                        ),
                                      )
                                    ],
                                  );
                                }),
                            ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                 shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  var data = snapshot.data!.docs[i];
                                  _emailController = TextEditingController(text: data['email']);
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex:2,
                                        child: Text('Email :',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Expanded(
                                        flex:5,
                                        child:TextField(
                                          //initialValue: data['name'] ,
                                          controller: _emailController ,
                                        ),
                                      )
                                    ],
                                  );
                                }),
                            ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  var data = snapshot.data!.docs[i];
                                  _phoneController = TextEditingController(text: data['phone']);
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex:2,
                                        child: Text('Phone :',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Expanded(
                                        flex:5,
                                        child:TextField(
                                          //initialValue: data['name'] ,
                                          controller: _phoneController ,
                                        ),
                                      )
                                    ],
                                  );
                                }),
                            ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  var data = snapshot.data!.docs[i];
                                  _dobController = TextEditingController(text: data['dateofbirth']);
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex:2,
                                        child: Text('Date of Birth :',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Expanded(
                                        flex:5,
                                        child:TextField(
                                          //initialValue: data['name'] ,
                                          controller: _dobController ,
                                        ),
                                      )
                                    ],
                                  );
                                }),
                            ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  var data = snapshot.data!.docs[i];
                                  _addressController = TextEditingController(text: data['address']);
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex:2,
                                        child: Text('Address :',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Expanded(
                                        flex:5,
                                        child:TextField(
                                          //initialValue: data['name'] ,
                                          controller: _addressController ,
                                        ),
                                      )
                                    ],
                                  );
                                }),
                          ],
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }

                    ///working
                  }),
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
                    color: Colors.blue,
                  ),
                ),
                onTap: () {
                  updateUser();
                  Navigator.pushNamed(context, '/userProfile');
                },
              ),
            ),
            Padding(
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
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
