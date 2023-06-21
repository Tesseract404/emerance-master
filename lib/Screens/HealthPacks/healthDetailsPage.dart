import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/Auth/firebaseManager.dart';
import 'package:emerance/widgets/toasts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Auth/APIs.dart';
import '../../widgets/actionButton.dart';
import '../../widgets/formFieldWidget.dart';

class healthDetailsPage extends StatefulWidget {
  const healthDetailsPage({Key? key}) : super(key: key);

  @override
  State<healthDetailsPage> createState() => _healthDetailsPageState();
}

class _healthDetailsPageState extends State<healthDetailsPage> {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User get user => auth.currentUser!;
  // final DatabaseReference _database = FirebaseDatabase.instance.ref();
  //final CollectionReference _database = FirebaseFirestore.instance.collection('User/$user/insurance');
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _sexController = TextEditingController();
  final _emailController = TextEditingController();
  late String  _insurancePack= 'Bronze' ;
  late String  _insuranceType= 'Car' ;
  List<String> _insuranceOptionsPack = ['Bronze', 'Silver', 'Gold','Platinum'];
  List<String> _insuranceOptions  = ['Car', 'Health'];
  // final String uid = auth.currentUser!.uid;

  // Future<void> getUserDocumentId(String userId) async {
  //   try {
  //     final DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .get();
  //     if (snapshot.exists) {
  //       final String documentId = snapshot.id;
  //       print('Document ID: $documentId');
  //     } else {
  //       print('User document does not exist.');
  //     }
  //   } catch (e) {
  //     print('Error retrieving user document ID: $e');
  //   }
  // }

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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 1, 1),
              child: Text(
                'Enter datails :',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 490,
                width: 365,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFc3c7c4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    formFieldWidget(
                        title: 'Name :', controller: _nameController),
                    formFieldWidget(title: 'Age :', controller: _ageController),
                    formFieldWidget(title: 'Sex :', controller: _sexController),
                    formFieldWidget(
                        title: 'Email :', controller: _emailController),
                    formFieldWidget(
                        title: 'Home Address :',
                        controller: _addressController),
                    formFieldWidget(title: 'Phone No :', controller: _phoneController),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          Expanded(

                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                              child: Text(
                                'Insurance :',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(7, 15, 0, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12
                                ),
                                child:
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: DropdownButtonFormField<String>(
                                    value: _insuranceType ,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _insuranceType= newValue!;
                                      });
                                    },
                                    items: _insuranceOptions.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600
                                        ),
                                        ),
                                      );
                                    }).toList(),
                                    decoration: const InputDecoration.collapsed(hintText: '',
                                    //   border:  OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //   color: Colors.black87,
                                    //   width: 2.0,
                                    // ),
                                    // ),
                                  ),
                            ),
                                ),
                              ),
                          )
                          ),
                          Expanded(
                            flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(7, 15, 0, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12
                                  ),
                                  child:
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: DropdownButtonFormField<String>(
                                      value: _insurancePack ,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _insurancePack= newValue!;
                                        });
                                      },
                                      items: _insuranceOptionsPack.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600

                                            ),),
                                        );
                                      }).toList(),
                                      decoration: const InputDecoration.collapsed(hintText: '',
                                        //   border:  OutlineInputBorder(
                                        //   borderSide: BorderSide(
                                        //   color: Colors.black87,
                                        //   width: 2.0,
                                        // ),
                                        // ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 17, 0, 0),
                          child: Text(
                            'Add Medical files(optional) :',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.inactiveGray,
                            ),
                            child: Icon(
                              CupertinoIcons.plus,
                              color: Colors.black38,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
             //    child: actionButton(
             //  height: 0.06,
             //  width: 0.42,
             //  route: '/payment',
             //  title: 'Sumbit',
             // ),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.width*0.42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF1d66db)
                  ),
                  child: MaterialButton(
                    onPressed: () {
                       coll();
                      Navigator.pushNamed(context, '/payment');
                    },
                    child: Center(
                      child: Text(
                        'Sumbit',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 21,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
  Future<String?> coll() async{
    //CollectionReference users = FirebaseFirestore.instance.collection('User') ;
    final cuser = FirebaseAuth.instance;
    //var result = await users.doc();
    submitForm(id:cuser.currentUser!.uid);
  }

  Future<String> submitForm({String? id}) async {
    // // String name = _nameController.text;
    // //     // String age = _ageController.text;
    // //     // String sex = _sexController.text;
    // //     // String email = _emailController.text;
    // //     // String address = _addressController.text;
    // //     // String phone = _phoneController.text;
    // try{
    //   await FirebaseFirestore.instance.collection('User').add({
    //     // 'name': name,
    //     // 'age': age,
    //     // 'sex': sex,
    //     // 'email': email,
    //     // 'address': address,
    //     // 'phoneNo': phone,
    //     // 'insuranceType': _insuranceType,
    //     // 'insurancePack': _insurancePack,
    //     'name': _ageController.text,
    //     'age': _sexController.text,
    //     'sex': _emailController.text,
    //     'email': _emailController.text,
    //     'address': _addressController.text,
    //     'phoneNo': _phoneController.text,
    //     'insuranceType': _insuranceType,
    //     'insurancePack': _insurancePack,
    //   }).then((value) {
    //     toasts.toastMessage('Submitted');
    //     Navigator.pushNamed(context,'/login');
    //   });
    //   _nameController.clear();
    //   _ageController.clear();
    //   _sexController.clear();
    //   _emailController.clear();
    //   _addressController.clear();
    //   _phoneController.clear();
    // }on FirebaseAuthException catch (e) {
    //   setState(() {
    //     toasts.toastMessage(e.message!);
    //   });
    // }
    CollectionReference user = FirebaseFirestore.instance.collection('User') ;
    user.doc(id).collection('Insurance').doc(id).set({
          'name': _nameController.text,
          'age': _ageController.text,
          'sex': _sexController.text,
          'email': _emailController.text,
          'address': _addressController.text,
          'phoneNo': _phoneController.text,
          'insuranceType': _insuranceType,
          'insurancePack': _insurancePack,
    }).then((value) {
          toasts.toastMessage('Information Submitted Successfully');
        });
      _nameController.clear();
      _ageController.clear();
      _sexController.clear();
      _emailController.clear();
      _addressController.clear();
      _phoneController.clear();
    return 'Success';
  }
}
