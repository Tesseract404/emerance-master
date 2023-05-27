import 'package:emerance/widgets/gap.dart';
import 'package:flutter/material.dart';

import '../Screens/Insurance/Ins_Details.dart';
class ListPlanButton extends StatelessWidget {
  final String type ;
  final title;
  final String insurance;
    const ListPlanButton({Key? key,
    required this.type,
    this.title,
    required this.insurance
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  const Ins_Details(plan: 'Bronze Plan', image: 'assets/Bronze.png', name: ' dsa1', model: 'das1', year: ' ads1', vNo: 'asas1 ',exDate: 'sadad',),)
          );
        },
        child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffced6de)
         ),
            child: Row(
              children: [
                gap(height: 0, width: 15),
                /// use int switch
                Image(image: AssetImage(type),
                height: 70,
                  width: 70,
                ),
                gap(height: 0, width: 18),

                ///use of auth
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          gap(height: 40, width:0 ),
                          Text(title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff01283b) ,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                gap(height: 0, width: 30),
                Expanded(
                  flex: 2,
                  child: Image(image: AssetImage(insurance),
                    height: 65,
                    width: 65,
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
