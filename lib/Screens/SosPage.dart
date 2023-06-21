import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emerance/widgets/EmergencyWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/gap.dart';

class SosPage extends StatefulWidget {
  const SosPage({Key? key}) : super(key: key);

  @override
  State<SosPage> createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  final cuser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebebeb),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFebebeb),
        leading: const BackButton(
          color: Colors.black87,
        ),
      ),
      body: Column(
        children: [
          // Divider(
          //   thickness: 1,
          // ),
          gap(height: 50, width: 5),
          Center(
            child: Text(
              'Emergency Response',
              style: TextStyle(
                fontFamily: 'Academy Engraved LET',
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color(0xffe3305d),
              ),
            ),
          ),
          gap(height: 65, width: 1),

          StreamBuilder(

              ///working
              stream: FirebaseFirestore.instance
                  .collection("User")
                  .where("userid", isEqualTo: cuser.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var data = snapshot.data!.docs[i];
                          if (data['insurance'] == 'Only Health Insurace') {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(80, 1, 80, 1),
                              child: EmergencyWidget(
                                image: 'assets/ambulance.png',
                                title: 'Ambulance',
                              ),
                            );
                          } else if (data['insurance'] == 'Only Car Insurace') {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(80, 1, 80, 1),
                              child: EmergencyWidget(
                                image: 'assets/tow.png',
                                title: 'Tow Truck',
                              ),
                            );
                          } else {
                            return Column(
                              children: [
                                EmergencyWidget(
                                  image: 'assets/ambulance.png',
                                  title: 'Ambulance',
                                ),
                                gap(height: 25, width: 1),
                                EmergencyWidget(
                                  image: 'assets/tow.png',
                                  title: 'Tow Truck',
                                )
                              ],
                            );
                          }
                        }),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ],
      ),
    );
  }
}

// import 'package:emerance/widgets/EmergencyWidget.dart';
// import 'package:flutter/material.dart';
//
// import '../widgets/gap.dart';
//
// class SosPage extends StatefulWidget {
//   const SosPage({Key? key}) : super(key: key);
//
//   @override
//   State<SosPage> createState() => _SosPageState();
// }
//
// class _SosPageState extends State<SosPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFebebeb),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color(0xFFebebeb),
//         leading: const BackButton(
//           color: Colors.black87,
//         ),
//       ),
//       body: Column(
//         children: const [
//           // Divider(
//           //   thickness: 1,
//           // ),
//           gap(height: 50, width: 5),
//           Center(
//             child: Text('Emergency Response',
//               style: TextStyle(
//                 fontFamily: 'Academy Engraved LET',
//                 fontSize: 30,
//                 fontWeight: FontWeight.w800,
//                 color: Color(0xffe3305d) ,
//               ),
//             ),
//           ),
//           gap(height: 65, width: 1),
//           EmergencyWidget(image: 'assets/tow.png',title: 'Tow Truck',),
//           gap(height: 25, width: 1),
//           EmergencyWidget(image: 'assets/ambulance.png',title: 'Ambulance',),
//         ],
//       ),
//     );
//   }
// }