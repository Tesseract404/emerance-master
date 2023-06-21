import 'package:emerance/widgets/actionButton.dart';
import 'package:flutter/material.dart';
class submitDetailsPage extends StatefulWidget {
  const submitDetailsPage({Key? key}) : super(key: key);

  @override
  State<submitDetailsPage> createState() => _submitDetailsPageState();
}

class _submitDetailsPageState extends State<submitDetailsPage> {
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
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Enter Proper Details",
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 25,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          SizedBox(height: 38,),
          Container(
            height: MediaQuery.of(context).size.height*0.15,
            width: MediaQuery.of(context).size.width*0.88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffd5dce3),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Add Image",
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: MediaQuery.of(context).size.height*0.10,
            width: MediaQuery.of(context).size.width*0.88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffd5dce3),
            ),
          ),
          SizedBox(height: 40),
          const actionButton(height: 0.05, width: 0.4, route: '/approval', title: 'Submit',),

        ],
      )

    );
  }
}
