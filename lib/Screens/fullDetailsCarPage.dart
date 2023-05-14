import 'package:emerance/widgets/Previlages.dart';
import 'package:emerance/widgets/detailswidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/gap.dart';
class fullDetailsCar extends StatefulWidget {

  const fullDetailsCar({Key? key,

  }
      ) : super(key: key);
  @override
  _fullDetailsCarState createState() => _fullDetailsCarState();
}
class _fullDetailsCarState extends State<fullDetailsCar> {
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
        // title: Text(
        //   'Emerance',
        //   style: TextStyle(
        //     fontFamily: 'Academy Engraved LET',
        //     fontSize: 23,
        //     fontWeight: FontWeight.w600,
        //     color: Colors.green ,
        //   ),
        // ),
      ),
      body: Column(
        children: [
          detailsWidget(image: 'assets/Bronze.png',title: 'Bronze Plan',subtitle:'Our basic cover that provides essential protection for your car' ,),
          Column(
            children: [
              // Row(
              //   children: [Icon(CupertinoIcons.checkmark),gap(width:5 ,height: 1,),Text(Previlages.pc1b,)],
              // )
            ],
          )
        ],
      ),
    );
  }
}
