import 'package:emerance/widgets/Previlages.dart';
import 'package:emerance/widgets/detailswidget.dart';
import 'package:emerance/widgets/points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/GetPlanButton.dart';
import '../../widgets/gap.dart';
class CarBronzePage extends StatefulWidget {

  const CarBronzePage({Key? key,
  }
      ) : super(key: key);
  @override
  _CarBronzePageState createState() => _CarBronzePageState();
}
class _CarBronzePageState extends State<CarBronzePage> {
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
          detailsWidget(image: 'assets/Bronze.png',title: 'Bronze Plan',subtitle:'Our basic cover that provides essential protection for your car' ,),
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
                    points(select: 1,title: Previlages.pc1b,),
                    points(select: 1,title: Previlages.pc2b,),
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
          Text('RM 399/Year',
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
