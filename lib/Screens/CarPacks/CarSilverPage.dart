import 'package:flutter/material.dart';

import '../../widgets/GetPlanButton.dart';
import '../../widgets/Previlages.dart';
import '../../widgets/detailswidget.dart';
import '../../widgets/gap.dart';
import '../../widgets/points.dart';
class CarSilverPage extends StatefulWidget {
  const CarSilverPage({Key? key}) : super(key: key);

  @override
  State<CarSilverPage> createState() => _CarSilverPageState();
}

class _CarSilverPageState extends State<CarSilverPage> {
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
            detailsWidget(image: 'assets/Silver.png',title: 'Silver Plan',subtitle:'Our value-for-money cover that provides essential protection for your car.' ,),
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
                      points(select: 1,title: Previlages.pc1s,),
                      points(select: 1,title: Previlages.pc2s,),
                      points(select: 1,title: Previlages.pc3 ,),
                      points(select: 1,title: Previlages.pc4,),
                      points(select: 1,title: Previlages.pc5,),
                      points(select: 0,title: Previlages.pc6,),
                      points(select: 0,title: Previlages.pc7,),
                      points(select: 0,title: Previlages.pc8,),
                      points(select: 0,title: Previlages.pc9,)
                    ],
                  ),
                ),
              ),
            ),
            gap(height: 25, width: 0),
            Text('RM 549/Year',
              style: TextStyle(
                fontFamily: 'Academy Engraved LET',
                fontSize: 23,
                fontWeight: FontWeight.w900,
                color: Colors.black87 ,
              ),
            ),
            gap(height: 25, width: 0),
            GetPlanButton(indicator: 2,)
          ],
        ),
      ),
    );
  }
}
