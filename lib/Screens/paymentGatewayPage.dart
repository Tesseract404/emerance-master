import 'package:emerance/widgets/actionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/paymentWidget.dart';

class paymentGatewayPage extends StatefulWidget {
  const paymentGatewayPage({Key? key}) : super(key: key);

  @override
  State<paymentGatewayPage> createState() => _paymentGatewayPageState();
}

class _paymentGatewayPageState extends State<paymentGatewayPage> {
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
              child: Center(
                child: Text(
                  'Payment methods',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(25, 1, 0, 0),
            //   child: Text(
            //     'All sales insight below',
            //     style: TextStyle(
            //         fontSize: 16,
            //         color: Colors.black87,
            //         fontWeight: FontWeight.w400),
            //   ),
            // ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                paymentWidget(
                  image: 'assets/card.png',
                  route: '',
                  title: 'Card Payment',
                ),
                paymentWidget(
                  image: 'assets/phonepay.png',
                  route: ' ',
                  title: 'MobileBanking',
                ),
                paymentWidget(
                  image: 'assets/bank.png',
                  route: ' ',
                  title: 'Bank Payment',
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'ID no:',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      decoration: InputDecoration(

                          //label: Text('Full Name :')
                          ),
                    ),
                  )
                ],
              ),
            ),Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Amount :',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      decoration: InputDecoration(

                          //label: Text('Full Name :')
                          ),
                    ),
                  )
                ],
              ),
            ),Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Contact :',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      decoration: InputDecoration(

                          //label: Text('Full Name :')
                          ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 60,),
            Center(child: actionButton(height: 0.06, width: 0.38, route: '', title: 'Pay and Proceed',))
          ],
        ),
      ),
    );
  }
}
