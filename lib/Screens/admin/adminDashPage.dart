import 'package:emerance/widgets/adminWidgets/dashboardCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/adminWidgets/dashboradBox.dart';
class adminDashPage extends StatefulWidget {
  const adminDashPage({Key? key}) : super(key: key);

  @override
  State<adminDashPage> createState() => _adminDashPageState();
}

class _adminDashPageState extends State<adminDashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebebeb),
      appBar: AppBar(
        backgroundColor: Color(0xFFebebeb),
        elevation: 0,
        leading: InkWell(onTap: () {

        },
          child:const Icon(
              CupertinoIcons.bars,
            color: Colors.black87 ,
            size: 30,
          ),
        ),
        title: Row(
          children: [
            SizedBox(width: 289),
            InkWell(onTap: () {
              Navigator.pushNamed(context,'/adminprofile');
            },
              child:const Icon(
                CupertinoIcons.person_crop_circle,
                color: Colors.black87,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Text(
                'Admin Dashborad',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87 ,
                ),
              ),
            ),
            SizedBox(height: 40 ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 dashboradBox(title: 'Sales', image: 'assets/sales.png', route: '/sales',),
                 dashboradBox(title: 'Claim List', image: 'assets/list.png', route: '/claimList',),
                 dashboradBox(title: 'Income Statement', image: 'assets/income.png', route: '/income',),
              ],
            ),
            dashboardCard(title: 'Users Info', image: 'assets/user.png', route: ''),
            dashboardCard(title: 'Tow Drivers Info', image: 'assets/trdriver.png', route: ''),
            dashboardCard(title: 'Mechanics Info', image: 'assets/mechanic.png', route: ''),
            dashboardCard(title: 'Ambulance Drivers Info', image: 'assets/amdriver.png', route: '')

          ],
        ),
      ),
    );
  }
}
