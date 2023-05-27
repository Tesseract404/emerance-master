import 'package:flutter/material.dart';
class catagory extends StatelessWidget {
  final String image;
  const catagory({Key? key,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,'/submit');
      },
      child: Container(
          height: 95,
          width: 95,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffb8b8b8)
          ),
          child: Center(child: Image(image: AssetImage(image),height: 55,width: 55,))),
    );
  }
}
