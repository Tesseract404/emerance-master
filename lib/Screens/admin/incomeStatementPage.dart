import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class incomeStatementPage extends StatefulWidget {
  const incomeStatementPage({Key? key}) : super(key: key);

  @override
  State<incomeStatementPage> createState() => _incomeStatementPageState();
}

class _incomeStatementPageState extends State<incomeStatementPage> {
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
              child: Text(
                'Income Statement',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 1, 0, 0),
              child: Text(
                'All details below',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Center(
                child: Container(
                  height: 600,
                  width: 380,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
              ),
            )

          ],
        ),

      ),

    );
  }
}
