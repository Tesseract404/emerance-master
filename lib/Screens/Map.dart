import 'package:flutter/material.dart';
class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'MAP'
        ),
      ),
    );
  }
}
