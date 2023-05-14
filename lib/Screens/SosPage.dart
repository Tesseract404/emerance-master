import 'package:flutter/material.dart';

class SosPage extends StatefulWidget {
  const SosPage({Key? key}) : super(key: key);

  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            'HELP!'
        ),
      ),
    );
  }
}
