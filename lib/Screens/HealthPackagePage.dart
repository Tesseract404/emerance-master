import 'package:flutter/material.dart';

import '../widgets/Planwidget.dart';
import '../widgets/gap.dart';
class HealthPackagePage extends StatefulWidget {
  const HealthPackagePage({Key? key}) : super(key: key);

  @override
  State<HealthPackagePage> createState() => _HealthPackagePageState();
}

class _HealthPackagePageState extends State<HealthPackagePage> {
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
        title: Text(
          'Emerance',
          style: TextStyle(
            fontFamily: 'Academy Engraved LET',
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.green ,
          ),
        ),

      ),
      body: Column(
        children: [
          Divider(
            thickness: 1,

          ),
          gap(height: 50, width: 5),
          Text('Our Health Insurances',
            style: TextStyle(
              fontFamily: 'Academy Engraved LET',
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.black87 ,
            ),
          ),
          gap(height: 50, width: 1),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              //color: Colors.red
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB( 24 , 25, 0, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/health_b');
                        },
                        child: Planwidget(
                            image: 'assets/Bronze.png',
                            title: 'Bronze Plan',
                            details: 'Up to RM 25,000 Coverage'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/health_s');
                          },
                          child: Planwidget(
                              image: 'assets/Silver.png',
                              title: 'Silver Plan',
                              details: 'Up to RM 50,000 Coverage'
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB( 24 , 25, 0, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/health_g');
                        },
                        child: Planwidget(
                            image: 'assets/Gold.png',
                            title: 'Gold Plan',
                            details: 'Up to RM 75,000 Coverage'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/health_p');
                          },
                          child: Planwidget(
                              image: 'assets/Platinum.png',
                              title: 'Platinum Plan',
                              details: 'Up to RM 1,00,000 Coverage'
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),

          ),
        ],
      ),
    );
  }
}
