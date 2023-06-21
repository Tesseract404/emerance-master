import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/actionButton.dart';
import '../../widgets/formFieldWidget.dart';
class carDetailsPage extends StatefulWidget {
  const carDetailsPage({Key? key}) : super(key: key);

  @override
  State<carDetailsPage> createState() => _carDetailsPageState();
}

class _carDetailsPageState extends State<carDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebebeb),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFebebeb),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            CupertinoIcons.back,
            color: Colors.black87,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 1, 1),
              child: Text(
                'Enter datails :',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: Container(
                height: 480,
                width: 365,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Color(0xFFc3c7c4),
                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    formFieldWidget(title: 'Name :' ),
                    formFieldWidget(title: 'Age :' ),
                    formFieldWidget(title: 'Email :',),
                    formFieldWidget(title: 'Home Address :',),
                    formFieldWidget(title: 'Phone No :',),
                    formFieldWidget(title: 'Car Model :',),
                    formFieldWidget(title: 'Car No :',),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 17, 0, 0),
                          child: Text(
                            'Add License and Papers :',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.inactiveGray,
                            ),
                            child: Icon(
                              CupertinoIcons.plus,
                              color: Colors.black38,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            Center(child: actionButton(height: 0.06, width: 0.42, route: '/payment', title: 'Sumbit',))
          ],
        ),
      ),
    );
  }
}
