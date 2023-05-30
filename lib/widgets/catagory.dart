import 'package:emerance/widgets/actionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class catagory extends StatelessWidget {
  final String image;
    catagory({Key? key,
    required this.image
  }) : super(key: key);
  final List<String> poplist= ["mechanic","tow"];
  @override
  Widget build(BuildContext context) {
    return  
      GestureDetector(
      onTap: (){
        showCupertinoModalPopup(context: context, builder: (context)=> CupertinoActionSheet(
          title: Text(
            'How can we assist you?',
            style: TextStyle(
                color: Colors.black87,
                 fontSize: 20,
                fontWeight: FontWeight.w500
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
                child: Text('Get a Professional Mechanic',style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                ),),
                onPressed: (){
                  Navigator.popAndPushNamed(context, '/map_m');

                },
            ),

            CupertinoActionSheetAction(
                child: Text('Get a Tow Truck',style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                ),),
                onPressed: (){
                  Navigator.popAndPushNamed(context, '/map_t');
                },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child:Text('Close',style: TextStyle(
              color: Colors.redAccent,
              fontSize: 18,
            ),),
          ),

        ));



      },
      child:Container(
          height: 95,
          width: 95,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffb8b8b8)
          ),
          child: Center(child: Image(image: AssetImage(image),height: 55,width: 55,))) );
    //   child: PopupMenuButton(
    //     //position: PopupMenuPosition.under,
    //
    //     onSelected: (value){
    //       if(value=="mechanic"){
    //         Navigator.pushNamed(context, '/map');
    //       }else{
    //         Navigator.pushNamed(context, '/map');
    //       }
    //     },
    //
    //     child: Container(
    //         height: 95,
    //         width: 95,
    //         decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             color: Color(0xffb8b8b8)
    //         ),
    //         child: Center(child: Image(image: AssetImage(image),height: 55,width: 55,))),
    //     itemBuilder: (context){
    //        return poplist.map((e) => PopupMenuItem(
    //          value: e,
    //          child: Padding(
    //            padding: const EdgeInsets.all(5.0),
    //            child: Center(child: Text(e,)),
    //          ),
    //            )
    //        ).toList();},
    //   ),
    // );
  }
}
// onTap: ( ){
// if(e=="mechanic"){
// Navigator.pushNamed(context, '/map');
// }else{
// Navigator.pushNamed(context, '/map');
// }
// },