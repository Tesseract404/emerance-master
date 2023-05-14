import 'package:flutter/material.dart';
class gap extends StatelessWidget {
  final double height, width;
  const gap({Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
