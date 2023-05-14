import 'package:emerance/widgets/GetPlanButton.dart';
import 'package:flutter/material.dart';
import '../../widgets/Previlages.dart';
import '../../widgets/detailswidget.dart';
import '../../widgets/gap.dart';
import '../../widgets/points.dart';
class HealthGoldPage extends StatefulWidget {
  const HealthGoldPage({Key? key}) : super(key: key);

  @override
  State<HealthGoldPage> createState() => _HealthGoldPageState();
}

class _HealthGoldPageState extends State<HealthGoldPage> {
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
      body: Column(
        children: [
          detailsWidget(image: 'assets/Gold.png',title: 'Gold Plan',subtitle:'Our premium cover that provides essential protection for your health' ,),
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
                    points(select: 1,title: Previlages.ph1g,),
                    points(select: 1,title: Previlages.ph2,),
                    points(select: 1,title: Previlages.ph3g ,),
                    points(select: 1,title: Previlages.ph4,),
                    points(select: 1,title: Previlages.ph5,),
                    points(select: 1,title: Previlages.ph6,),
                    points(select: 1,title: Previlages.ph7,),
                    points(select: 0,title: Previlages.ph8,),
                    points(select: 0,title: Previlages.ph9,)
                  ],
                ),
              ),
            ),
          ),
          gap(height: 25, width: 0),
          Text('RM 699/Year',
            style: TextStyle(
              fontFamily: 'Academy Engraved LET',
              fontSize: 23,
              fontWeight: FontWeight.w900,
              color: Colors.black87 ,
            ),
          ),
          gap(height: 25, width: 0),
          GetPlanButton()
        ],
      ),
    );
  }
}
