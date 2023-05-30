import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
class actionButtonwithIcon extends StatelessWidget {
  final title;
  final String route;
  final double height;
  final double width;
  final IconData icons;
  final double iconsize;
  final  Color iconcolor;
  const actionButtonwithIcon({Key? key, this.title, required this.route,
    required this.height, required this.width, required this.icons, required this.iconsize, required this.iconcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*height,
      width: MediaQuery.of(context).size.width*width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFF1d66db)
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context,route);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 1, 1, 1),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 22.5,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(width: 12,),
                Icon(icons,size:iconsize,color: iconcolor,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
