import 'package:flutter/material.dart';

import '../../widgets/actionButton.dart';
import '../../widgets/catagory.dart';
import '../../widgets/gap.dart';
class healthClaimPage extends StatefulWidget {
  const healthClaimPage({Key? key}) : super(key: key);

  @override
  State<healthClaimPage> createState() => _healthClaimPageState();
}

class _healthClaimPageState extends State<healthClaimPage> {
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
                      'Owner Name :' +
                          //widget.name
                          'Ratib Khan',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    gap(height: 5, width: 1),
                    Text(
                      'Vehicle Model :' +
                          //widget.model,
                          'Honda Civic',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    gap(height: 5, width: 1),
                    Text(
                      'Vehicle Year : 2016' ,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    gap(height: 5, width: 1),
                    Text(
                      'Vehicle No :AA616G51'  ,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    gap(height: 5, width: 1),
                    Text(
                      'Expiry date :dd/mm/yyyy'  ,
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
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(45, 5, 20, 0),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           catagory(image:'assets/tire.png'),
          //           Padding(
          //             padding: const EdgeInsets.all(15.0),
          //             child: catagory(image:'assets/battery.png'),
          //           ),
          //           catagory(image:'assets/windcrack.png')
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           catagory(image:'assets/fuel.png'),
          //           Padding(
          //             padding: const EdgeInsets.all(15.0),
          //             child: catagory(image:'assets/minor.png'),
          //           ),
          //           catagory(image:'assets/major.png')
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Center(
            child: Column(
              children:const [
                gap(height: 10, width: 1),
                actionButton(height: 0.06, width: 0.4,title: 'Others', route: '/submit',),
                gap(height: 16, width: 1),
                actionButton(height: 0.06, width: 0.4,title: 'Hotline', route: '/submit',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
