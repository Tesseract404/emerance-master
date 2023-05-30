import 'package:flutter/material.dart';
class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        ),
        context: context, builder: (context)=> Container(
        height: 250,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          color: Colors.white54,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [Image(image: AssetImage('assets/siren.png'),height: 50,width:50 ,),SizedBox(width: 20,),Text('Ambulance '+i.toString(),style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87
              ),)],
            )

          ],
        ),
      ),

      )
    );
  }
}
