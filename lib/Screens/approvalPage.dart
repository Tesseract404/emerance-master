import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class approvalPage extends StatefulWidget {
  const approvalPage({Key? key}) : super(key: key);

  @override
  State<approvalPage> createState() => _approvalPageState();
}

class _approvalPageState extends State<approvalPage> {
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
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 25, 1, 1),
            child: Text('Health-Insurance Claim Status :',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18
            ),),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: 70,
               width: 220,
               decoration: BoxDecoration(
                 color: CupertinoColors.systemYellow,
                 borderRadius: BorderRadius.circular(10)
               ),
              child: Center(
                child: Text(
                  'Pending',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
