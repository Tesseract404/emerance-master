import 'package:flutter/material.dart';
class PackagePage extends StatefulWidget {
  const PackagePage({Key? key}) : super(key: key);

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            'Package Page!'
        ),
      ),
    );
  }
}
