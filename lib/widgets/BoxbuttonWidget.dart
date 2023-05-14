import 'package:emerance/widgets/ReusableRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BoxbuttonWidget extends StatelessWidget {
  final title ;
  final IconData iconData;
  final Color color;
  final Color iconcolor;
  final String routeName;
  const BoxbuttonWidget({Key? key,
    required this.title,
    required this.iconData,
    required this.color,
    required this.routeName,
    required this.iconcolor,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          height: MediaQuery.of(context).size.height * .12,
          width: MediaQuery.of(context).size.width * .94 ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: color,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(iconData,
                    color: iconcolor,
                    size: 50,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 1, 1, 1),
                  child: Text(title,
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent ,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Icon(CupertinoIcons.right_chevron,
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),



        ),
      );
  }
}
