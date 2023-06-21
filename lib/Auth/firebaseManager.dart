
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/Auth/specialController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class firebaseManager extends StatelessWidget {
  String error = "";
  specialController _insuranceController = Get.put(specialController());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phonenoController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {

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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //     .then((value) {
      //   Navigator.pushNamed(context, '/login');
      // });
      addUserDetails(
        _nameController.text.trim(),
        _passwordController.text.trim(),
        _dobController.text.trim(),
        _emailController.text.trim(),
        int.parse(_phonenoController.text.trim()),
        _addressController.text.trim(),
        _insuranceController.text.toString(),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message!;
      });
    }
  }

  Future addUserDetails(String name, String pass, String dob, String email, int phoneNo,
      String address, String insurance) async {
    await FirebaseFirestore.instance.collection('User').add({
      'name': name,
      'password': pass,
      'date of birth': dob,
      'email': email,
      'phone': phoneNo,
      'address': address,
      'insurance': insurance,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void setState(Null Function() param0) {}
}
