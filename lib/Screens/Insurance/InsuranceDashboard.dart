import 'package:emerance/widgets/ListPlanButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/gap.dart';
class InsuranceDashboard extends StatefulWidget {
  const InsuranceDashboard({Key? key}) : super(key: key);

  @override
  State<InsuranceDashboard> createState() => _InsuranceDashboardState();
}

class _InsuranceDashboardState extends State<InsuranceDashboard> {
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
        centerTitle: true,
        title: Row(
          children: [
            gap(height: 0, width: 80),
            Text(
              'Emerance',
              style: TextStyle(
                fontFamily: 'Academy Engraved LET',
                fontSize: 23,
                fontWeight: FontWeight.w600,
                color: Colors.green ,
              ),
            ),
            gap(height: 0, width: 110),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/userProfile');
              },
              child: Icon(
                CupertinoIcons.person_crop_circle,
                size: 28,
                color: Colors.black54,
              ),
            )
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              thickness: 1,

            ),
            gap(height: 50, width: 5),
            Center(
              child: Text('Insurance Dashboard',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87 ,
                ),
              ),
            ),
            gap(height: 50, width: 1),

            ListPlanButton(type: 'assets/car.png', insurance: 'assets/Platinum.png',title: 'Honda Civic 2016', target: 'Car',),
            ListPlanButton(type: 'assets/health.png', insurance: 'assets/Gold.png',title: 'Ratib khan'+' Age:'+'22', target: 'Health',),
          ],
        ),
      ),
    );
  }
}
