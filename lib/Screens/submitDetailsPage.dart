import 'package:flutter/material.dart';
class submitDetailsPage extends StatefulWidget {
  const submitDetailsPage({Key? key}) : super(key: key);

  @override
  State<submitDetailsPage> createState() => _submitDetailsPageState();
}

class _submitDetailsPageState extends State<submitDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFebebeb),
    appBar: AppBar(
    elevation: 0,
    backgroundColor: Color(0xFFebebeb),
    leading: const BackButton(
    color: Colors.black87,
      ),
     ),
    );
  }
}
