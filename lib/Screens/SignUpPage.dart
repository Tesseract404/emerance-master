import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/Auth/specialController.dart';
import 'package:emerance/Auth/user_model.dart';
import 'package:emerance/widgets/toasts.dart';
import 'package:emerance/widgets/togglebuttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {

  final auth = FirebaseAuth.instance;
  String error = "";
   late final CollectionReference userList= FirebaseFirestore.instance.collection('User');

  specialController _insuranceController = Get.put(specialController());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phonenoController = TextEditingController();
  final _addressController = TextEditingController();
  final _sessionController = TextEditingController();
  final _imageController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _dobController.dispose();
    _phonenoController.dispose();
    _addressController.dispose();
    _insuranceController.dispose();
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      )
          .then((value) {
            toasts.toastMessage('Registered Successfully');
        Navigator.pushNamed(context,'/login');
      });
      addUserDetails(
        _nameController.text.trim(),
        _passwordController.text.trim(),
        _dobController.text.trim(),
        _emailController.text.trim(),
        _phonenoController.text.trim() ,
        _addressController.text.trim(),
        _insuranceController.text.toString(),
        _sessionController.text.trim(),
        _imageController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        // error = e.message!;
        toasts.toastMessage(e.message!);
      });
    }
  }

  Future addUserDetails(String name, String pass, String dob, String email, String phoneNo,
      String address, String insurance, String userid, String image) async {
    await userList.add({
      'name': name,
      'password': pass,
      'date of birth': dob,
      'email': email,
      'phone': phoneNo,
      'address': address,
      'insurance': insurance,
      'userid': auth.currentUser!.uid,
      'image' : image,
    });
  }
  ///-----------------------------------------------------///
  // Future getUsersList() async{
  //   List itemList = [];
  //   try{
  //     await userList.get().then((querySnapshot){
  //       querySnapshot.docs.forEach((element) {
  //        itemList.add(element.data);
  //       });
  //     });
  //
  //   }catch(e){
  //
  //   }
  // }
  // @override
  // void initState() {
  //
  //    super.initState();
  //    fetchDataList();
  // }
  //
  // fetchDataList() async {
  //   dynamic result = await getUsersList();
  //   if(result == null){
  //     print('Unable to fetch data!');
  //   }else{
  //     setState(() {
  //       userProfileList = result;
  //     });
  //   }
  // }
  ///-----------------------------------------------------///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00072D),
      body: SafeArea(
        top: true,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * .07),
                        child: Image(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width * .2,
                          image: AssetImage("assets/logo.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .014,
                      horizontal: MediaQuery.of(context).size.width * .07),
                  child: Text(
                    'Registration',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 30, 7, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Name',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PlafairDisplay',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 30,
                            width: 10,
                            child: TextField(
                              //obscureText: true,
                              controller: _nameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                // labelText:'Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 15, 7, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Set Password',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PlafairDisplay',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 30,
                            width: 10,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                // labelText:'Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 15, 7, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                            child: Text(
                              'Date of Birth',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PlafairDisplay',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 30,
                            width: 10,
                            child: TextField(
                              enabled: true,
                              controller: _dobController,
                              onTap: () async {
                                DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1901),
                                  lastDate: DateTime(2030),
                                );
                                if (pickeddate != null) {
                                  setState(() {
                                    _dobController.text =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickeddate);
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.blue,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(80)),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 15, 7, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Email Address',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PlafairDisplay',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 30,
                            width: 10,
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                // labelText:'Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 15, 7, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Phone Number',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PlafairDisplay',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 30,
                            width: 10,
                            child: TextField(
                              //obscureText: true,
                              controller: _phonenoController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                // labelText:'Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 15, 7, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              'Address',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PlafairDisplay',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 30,
                            width: 10,
                            child: TextField(
                              //obscureText: true,
                              controller: _addressController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                // labelText:'Password',
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlayfairDisplay'),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 0, 5),
                  child: Row(
                    children: [
                      Text(
                        'Which one you prefer ?',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xFFFE9292),
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 21,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),

                /// RADIO BUTTONS ///

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Obx(
                              () => Radio(
                                value: "Car & Health Insurace",
                                groupValue: _insuranceController
                                    .selectedInsurance.value,
                                activeColor: Colors.cyanAccent,
                                fillColor:
                                    MaterialStateProperty.all(Colors.cyan),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (value) {
                                  // setState(() {
                                  //   _value = value! ;
                                  // });
                                  _insuranceController.onChangeinsurance(value);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 7,
                              child: Text(
                                'Car & Health Insurace',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlayfairDisplay',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Obx(
                              () => Radio(
                                value: "Only Car Insurace",
                                groupValue: _insuranceController
                                    .selectedInsurance.value,
                                activeColor: Colors.cyanAccent,
                                fillColor:
                                    MaterialStateProperty.all(Colors.cyan),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (value) {
                                  // setState(() {
                                  //   _value = value! ;
                                  // });
                                  _insuranceController.onChangeinsurance(value);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 7,
                              child: Text(
                                'Only Car Insurance',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlayfairDisplay',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Obx(
                              () => Radio(
                                value: "Only Health Insurace",
                                groupValue: _insuranceController
                                    .selectedInsurance.value,
                                activeColor: Colors.cyanAccent,
                                fillColor:
                                    MaterialStateProperty.all(Colors.cyan),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (value) {
                                  // setState(() {
                                  //   _value = value! ;
                                  // });
                                  _insuranceController.onChangeinsurance(value);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 7,
                              child: Text(
                                'Only Health Insurance',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlayfairDisplay',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(25),
                  height: MediaQuery.of(context).size.height * .053,
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF1d66db)),
                  child: MaterialButton(
                    onPressed: () {
                      signUp();
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PlayfairDisplay',
                          fontSize: 22.5,
                          fontWeight: FontWeight.w500),
                    ),
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
