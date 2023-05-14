import 'package:flutter/material.dart';

import 'gap.dart';

class detailsWidget extends StatelessWidget {
  final title,subtitle;
  final String image;
  const detailsWidget({
    Key? key,
    this.title,
    this.subtitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title,
            style: TextStyle(
               fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black87 ,
            ),
          ),
          gap(height: 11, width: 1 ),
          Image(image: AssetImage(image),
          height: 160,
            width: 160,
          ),
          gap(height: 15, width: 1 ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
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
