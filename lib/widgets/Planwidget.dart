import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gap.dart';

class Planwidget extends StatelessWidget {
  final details,title;
  final String image;
  const Planwidget({Key? key,
    this.details,
    required this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xff947c7c), //New
              blurRadius: 4.0,
              spreadRadius: 0.01)
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xffdeb6b6)),
        color: Color(0xffF3E1E1),
      ),
      child: Column(
        children: [
          gap(height: 8, width: 1,),
          Container(
            height: 90,
              width: 90,
              child: Image(image: AssetImage(image))
          ),
          Text(title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.blueAccent ,
            ),
          ),
          gap(height: 12, width: 1),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(details,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: Colors.black87 ,
              ),
            ),
          )
        ],
      ),
    );
  }
}
