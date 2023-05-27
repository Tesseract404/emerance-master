import 'package:emerance/widgets/EmergencyWidget.dart';
import 'package:flutter/material.dart';

import '../widgets/gap.dart';

class SosPage extends StatefulWidget {
  const SosPage({Key? key}) : super(key: key);

  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
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
      body: Column(
        children: [
          // Divider(
          //   thickness: 1,
          // ),
          gap(height: 50, width: 5),
          Center(
            child: Text('Emergency Response',
              style: TextStyle(
                fontFamily: 'Academy Engraved LET',
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color(0xffe3305d) ,
              ),
            ),
          ),
          gap(height: 65, width: 1),
          EmergencyWidget(image: 'assets/tow.png',title: 'Tow Truck',),
          gap(height: 25, width: 1),
          EmergencyWidget(image: 'assets/ambulance.png',title: 'Ambulance',),
        ],
      ),
    );
  }
}
