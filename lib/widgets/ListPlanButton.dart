import 'package:emerance/widgets/gap.dart';
import 'package:flutter/material.dart';

import '../Screens/Insurance/carClaimPage.dart';
class ListPlanButton extends StatelessWidget {
  final String type ;
  final String target;
  final title;
  final String insurance;
    const ListPlanButton({Key? key,
    required this.type,
    this.title,
    required this.insurance,
      required this.target
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: GestureDetector(
        onTap: (){
          if(target=='Car'){
            // Navigator.push(context,MaterialPageRoute(builder: (context) =>  const Ins_Details(),));
            Navigator.pushNamed(context, '/carclaim');
          }else{
            Navigator.pushNamed(context, '/healthclaim');
          }
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
