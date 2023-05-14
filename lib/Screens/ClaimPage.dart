import 'package:flutter/material.dart';
class ClaimPage extends StatefulWidget {
  const ClaimPage({Key? key}) : super(key: key);

  @override
  State<ClaimPage> createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Claim Page!'
        ),
      ),
    );
  }
}
