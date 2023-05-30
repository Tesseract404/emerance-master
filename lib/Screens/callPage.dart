import 'package:flutter/material.dart';
class callPage extends StatefulWidget {
  const callPage({Key? key}) : super(key: key);

  @override
  State<callPage> createState() => _callPageState();
}

class _callPageState extends State<callPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Text('Calling',
          style: TextStyle(
              color: Colors.white,
              fontSize: 22.5,
              fontWeight: FontWeight.w800
          ),),
        ],
      ),
    );
  }
}
