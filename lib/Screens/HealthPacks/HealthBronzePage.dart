import 'package:flutter/material.dart';

import '../../widgets/GetPlanButton.dart';
import '../../widgets/Previlages.dart';
import '../../widgets/detailswidget.dart';
import '../../widgets/gap.dart';
import '../../widgets/points.dart';
class HealthBronzePage extends StatefulWidget {
  const HealthBronzePage({Key? key}) : super(key: key);

  @override
  State<HealthBronzePage> createState() => _HealthBronzePageState();
}

class _HealthBronzePageState extends State<HealthBronzePage> {
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            detailsWidget(image: 'assets/Bronze.png',title: 'Bronze Plan',subtitle:'Our basic cover that provides essential protection for your Health' ,),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 20,  16, 0),
              child:
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      points(select: 1,title: Previlages.ph1b,),
                      points(select: 1,title: Previlages.ph2,),
                      points(select: 1,title: Previlages.ph3b ,),
                      points(select: 1,title: Previlages.ph4,),
                      points(select: 1,title: Previlages.ph5,),
                      points(select: 0,title: Previlages.ph6,),
                      points(select: 0,title: Previlages.ph7,),
                      points(select: 0,title: Previlages.ph8,),
                      points(select: 0,title: Previlages.ph9,)
                    ],
                  ),
                ),
              ),
            ),
            gap(height: 25, width: 0),
            Text('RM 399/Year',
              style: TextStyle(
                fontFamily: 'Academy Engraved LET',
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: Colors.black87 ,
              ),
            ),
            gap(height: 25, width: 0),
            GetPlanButton(indicator: 1,)
          ],
        ),
      ),
    );
  }
}
