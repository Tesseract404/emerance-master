import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget{
  @override
  State createState() => _UserProfilePage() ;


}

class _UserProfilePage extends State<UserProfilePage>{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: true,
         title: Text(
           'Profile',
           textAlign: TextAlign.start,
           style: TextStyle(
             fontFamily: 'PlayfairDisplay',
             fontSize: 19,
             fontWeight: FontWeight.w500,
             color: Colors.white,
           ),

         ),
       ),
       backgroundColor:Color(0xFF00072D),
       body: Column(
         children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(20, 60, 0, 0),
             child: Row(
               children: [
                 Expanded(
                   flex: 4,
                     child:Container(
                       child: Image(
                         alignment: Alignment.topLeft,
                         height: MediaQuery.of(context).size.height*.15,
                         width: MediaQuery.of(context).size.width*.15,
                         image: AssetImage("assets/man.png"),
                       ),
                     )
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 100, 0),
                   child: Expanded(
                     flex: 6,
                       child: Text(
                     'Allison Burgers',
                         textAlign: TextAlign.start,
                         style: TextStyle(
                           fontFamily: 'PlayfairDisplay',
                           fontSize: 25,
                           fontWeight: FontWeight.w600,
                           color: Colors.white,
                         ),
                   )
                   ),
                 )
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                   child: Expanded(
                     flex: 1,
                     child: Text(
                       'Email :',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.white,
                         fontWeight: FontWeight.w800,
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                   child: Expanded(
                     flex: 8,
                     child: Text(
                       'abcdefgh@gmail.com',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.blueAccent,

                       ),
                     ),
                       ),
                 ),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                   child: Expanded(
                     flex: 1,
                     child: Text(
                       'Password :',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.white,
                         fontWeight: FontWeight.w800,
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                   child: Expanded(
                     flex: 8,
                     child: Text(
                       '*********',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.blueAccent,

                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),


           Padding(
             padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                   child: Expanded(
                     flex: 1,
                     child: Text(
                       'Phone :',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.white,
                         fontWeight: FontWeight.w800,
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                   child: Expanded(
                     flex: 8,
                     child: Text(
                       '+999999999',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.blueAccent,

                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                   child: Expanded(
                     flex: 1,
                     child: Text(
                       'City/State :',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.white,
                         fontWeight: FontWeight.w800,
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                   child: Expanded(
                     flex: 8,
                     child: Text(
                       'Skudai, Jahar',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.blueAccent,

                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(0,20, 0, 0),
             child: Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                   child: Expanded(
                     flex: 1,
                     child: Text(
                       'Country :',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.white,
                         fontWeight: FontWeight.w800,
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(0, 0, 100, 0),
                   child: Expanded(
                     flex: 8,
                     child: Text(
                       'Malaysia',
                       textAlign: TextAlign.start,
                       style: TextStyle(
                         fontFamily: 'PlayfairDisplay',
                         fontSize: 18,
                         color: Colors.blueAccent,

                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Container(
             margin: EdgeInsets.all(50),
             height: MediaQuery.of(context).size.height*.053,
             width: MediaQuery.of(context).size.width*.6,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(100),
                 color: Color(0xFF1d66db)
             ),
             child: MaterialButton(
               onPressed: () {
               },
               child: Text(
                 "Edit Profile",
                 style: TextStyle(
                     color: Colors.white,
                     fontFamily: 'PlayfairDisplay',
                     fontSize: 22.5,
                     fontWeight: FontWeight.w500
                 ),
               ),
             ),
           ),
         ],
       )

     );
  }
}