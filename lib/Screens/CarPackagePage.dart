import 'package:emerance/widgets/gap.dart';
import 'package:flutter/material.dart';

import '../widgets/Planwidget.dart';
class CarPackagePage extends StatefulWidget {
  const CarPackagePage({Key? key}) : super(key: key);

  @override
  State<CarPackagePage> createState() => _CarPackagePageState();
}

class _CarPackagePageState extends State<CarPackagePage> {
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
          Text('Our Car Insurances',
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
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/car_b');
                        },
                        child: Planwidget(
                        image: 'assets/Bronze.png',
                        title: 'Bronze Plan',
                        details: '24/7 Towing Assistance up to *50 KM'
                        ),
                      ),
                       Expanded(
                         flex: 2,
                         child: Padding(
                           padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                           child: GestureDetector(
                             onTap: (){
                               Navigator.pushNamed(context, '/car_s');
                             },
                             child: Planwidget(
                      image: 'assets/Silver.png',
                      title: 'Silver Plan',
                      details: '24/7 Towing Assistance up to *70 KM'
                      ),
                           ),
                         ),
                       ),
                     ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/car_g');
                        },
                        child: Planwidget(
                            image: 'assets/Gold.png',
                            title: 'Gold Plan',
                            details: '24/7 Towing Assistance up to *100 KM'
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, '/car_p');
                            },
                            child: Planwidget(
                                image: 'assets/Platinum.png',
                                title: 'Platinum Plan',
                                details: '24/7 Towing Assistance up to *200 KM'
                            ),
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
