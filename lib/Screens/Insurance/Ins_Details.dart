import 'package:emerance/widgets/actionButton.dart';
import 'package:emerance/widgets/catagory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/gap.dart';

class Ins_Details extends StatefulWidget {
  ///not important
  final String plan, image, name, model, year, vNo, exDate;

  const Ins_Details(
      {Key? key,
      required this.plan,
      required this.image,
      required this.name,
      required this.model,
      required this.year,
      required this.vNo,
      required this.exDate})
      : super(key: key);

  @override
  _Ins_DetailsState createState() => _Ins_DetailsState();
}

class _Ins_DetailsState extends State<Ins_Details> {
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
        centerTitle: true,
        // title: Row(
        //   children: [
        //     gap(height: 0, width: 80),
        //     // Text(
        //     //   'Emerance',
        //     //   style: TextStyle(
        //     //     fontFamily: 'Academy Engraved LET',
        //     //     fontSize: 23,
        //     //     fontWeight: FontWeight.w600,
        //     //     color: Colors.green,
        //     //   ),
        //     // ),
        //     gap(height: 0, width: 110),
        //     InkWell(
        //       onTap: () {
        //         Navigator.pushNamed(context, '/userProfile');
        //       },
        //       child: Icon(
        //         CupertinoIcons.person_crop_circle,
        //         size: 28,
        //         color: Colors.black54,
        //       ),
        //     )
        //   ],
        // ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: 1,
          ),
          gap(height: 20, width: 5),
          Center(
            child: Text(
              'Claim Insurance',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
          ),
          gap(height: 20, width: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 1, 1, 1),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.17,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                  color: Color(0xffced6de),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Owner Name :' + widget.name,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    gap(height: 5, width: 1),
                    Text(
                      'Vehicle Model :' + widget.model,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    gap(height: 5, width: 1),
                    Text(
                      'Vehicle Year :' + widget.year,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    gap(height: 5, width: 1),
                    Text(
                      'Vehicle No :' + widget.vNo,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    gap(height: 5, width: 1),
                    Text(
                      'Expiry date :' + widget.exDate,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          ),
          gap(height: 18, width: 0),
          Center(
            child: Text(
              'Populer Reasons',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 5, 20, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    catagory(image:'assets/tire.png'),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: catagory(image:'assets/battery.png'),
                    ),
                    catagory(image:'assets/windcrack.png')
                  ],
                ),
                Row(
                  children: [
                    catagory(image:'assets/fuel.png'),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: catagory(image:'assets/minor.png'),
                    ),
                    catagory(image:'assets/major.png')
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children:[
                gap(height: 10, width: 1),
                actionButton(height: 0.06, width: 0.4,title: 'Others',),
                gap(height: 16, width: 1),
                actionButton(height: 0.06, width: 0.4,title: 'Hotline',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
